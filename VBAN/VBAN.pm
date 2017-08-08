# VBAN, a plugin to play VBAN streams 

# Copyright (C) 2017 by Markus Buschhoff
# Based on WaveInput, (C) 2008 Bryan Alton and others
# All rights reserved.

# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Plugins::VBAN::VBAN;

use strict;
use base qw(Slim::Player::Pipeline);
use Slim::Utils::Strings qw(string);
use Slim::Utils::Misc;
use Slim::Utils::Log;
use Slim::Utils::Prefs;

Slim::Player::ProtocolHandlers->registerHandler('vban', __PACKAGE__);

my $log		= logger('plugin.VBAN');

sub isRemote { 1 } 

sub bufferThreshold { 150 } 

sub new {

	my $class = shift;
	my $args  = shift;
	my $transcoder = $args->{'transcoder'};
	my $url        = $args->{'url'} ;
	my $client     = $args->{'client'};


	my $restoredurl;

	$restoredurl = $url;
	$restoredurl =~ s|^vban:||;

	Slim::Music::Info::setContentType($url, 'vban');
	my $quality = preferences('server')->client($client)->get('lameQuality');

	my $command = Slim::Player::TranscodingHelper::tokenizeConvertCommand2( $transcoder, $restoredurl, $url, 1, $quality );
	$log->debug("VBAN command =\'$command\'");

	my $self = $class->SUPER::new(undef, $command);

	${*$self}{'contentType'} = $transcoder->{'streamformat'};

	return $self;
}


sub canDoAction {
	my ( $class, $client, $url, $action ) = @_;
	$log->info("Action=$action");
	
	return 1;
}

sub canHandleTranscode {
	my ($self, $song) = @_;
	
	return 1;
}

sub getStreamBitrate {
	my ($self, $maxRate) = @_;
	
	return Slim::Player::Song::guessBitrateFromFormat(${*$self}{'contentType'}, $maxRate);
}

sub isAudioURL { 1 }

# XXX - I think that we scan the track twice, once from the playlist and then again when playing
sub scanUrl {
	my ( $class, $url, $args ) = @_;
	
	Slim::Utils::Scanner::Remote->scanURL($url, $args);
}

sub canDirectStream {
	return 0;
}

sub contentType 
{
	my $self = shift;

	return ${*$self}{'contentType'};
}


sub getMetadataFor {
	my ( $class, $client, $url, $forceCurrent ) = @_;

	my $icon = Plugins::VBAN::Plugin->_pluginDataFor('icon');

	$log->debug("Begin Function for $url $icon");

	
#	Slim::Music::Info::setCurrentTitle( $url, 'PC VBAN'  );
	return {
#		title    =>  'VBAN', 
		bitrate  =>  "CD ",
		icon   => $icon,
		cover  => $icon,
		type   => 'VBAN stream',
	};

}


1;
