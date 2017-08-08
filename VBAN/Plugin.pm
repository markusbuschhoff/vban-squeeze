# VBAN, a plugin to play VBAN streams 

# Copyright (C) 2017 by Markus Buschhoff
# Based on WaveInput, (C) 2008 Bryan Alton and others
# All rights reserved.

# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

use strict;

package Plugins::VBAN::Plugin;

use base qw(Slim::Plugin::OPMLBased);
use Slim::Utils::Log;
use Plugins::VBAN::VBAN;


# create log categogy before loading other modules
my $log = Slim::Utils::Log->addLogCategory({
	'category'     => 'plugin.VBAN',
	'defaultLevel' => 'ERROR',
#	'defaultLevel' => 'INFO',
	'description'  => getDisplayName(),
});


use Slim::Utils::Misc;


################################
### Plugin Interface ###########
################################

sub initPlugin 
{
	my $class = shift;
	$log->info("Initialising " . $class->_pluginDataFor('version'));
	return 1;
}


sub shutdownPlugin 
{
 	return;
}

sub getDisplayName() 
{ 
	return('PLUGIN_VBAN')
}

1;
