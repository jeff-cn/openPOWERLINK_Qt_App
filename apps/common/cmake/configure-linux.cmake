################################################################################
#
# Options specific for openPOWERLINK applications running on Linux
#
# Copyright (c) 2014, Kalycito Infotech Pvt. Ltd.,
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the copyright holders nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
################################################################################

SET(CONFIG_openPOWERLINK_BUILD_TYPE "Link to Application"
    CACHE STRING "Configure how to build the kernel stack")

SET(openPOWERLINK_StackBuildTypes
    "Link to Application;Linux Userspace Daemon;Linux Kernel Module;None"
    CACHE INTERNAL "List of possible kernel stack build types")

SET_PROPERTY(CACHE CONFIG_openPOWERLINK_BUILD_TYPE
             PROPERTY STRINGS ${openPOWERLINK_StackBuildTypes})

IF (CONFIG_openPOWERLINK_BUILD_TYPE STREQUAL "Link to Application")

    SET (CFG_KERNEL_STACK_DIRECTLINK ON CACHE INTERNAL
         "Link kernel stack directly into application (Single process solution)")
    UNSET (CFG_KERNEL_STACK_USERSPACE_DAEMON CACHE)
    UNSET (CFG_KERNEL_STACK_KERNEL_MODULE CACHE)

ELSEIF (CONFIG_openPOWERLINK_BUILD_TYPE STREQUAL "Linux Userspace Daemon")

    SET (CFG_KERNEL_STACK_USERSPACE_DAEMON ON CACHE INTERNAL
         "Build kernel stack as Linux userspace daemon")
    UNSET (CFG_KERNEL_STACK_DIRECTLINK CACHE)
    UNSET (CFG_KERNEL_STACK_KERNEL_MODULE CACHE)

ELSEIF (CONFIG_openPOWERLINK_BUILD_TYPE STREQUAL "Linux Kernel Module")

    SET (CFG_KERNEL_STACK_KERNEL_MODULE ON CACHE INTERNAL
         "Build kernel stack as Linux kernelspace module")
    UNSET (CFG_KERNEL_STACK_USERSPACE_DAEMON CACHE)
    UNSET (CFG_KERNEL_STACK_DIRECTLINK CACHE)

ELSEIF (CONFIG_openPOWERLINK_BUILD_TYPE STREQUAL "None")
    UNSET (CFG_KERNEL_STACK_USERSPACE_DAEMON CACHE)
    UNSET (CFG_KERNEL_STACK_KERNEL_MODULE CACHE)
    UNSET (CFG_KERNEL_STACK_DIRECTLINK CACHE)
ENDIF (CONFIG_openPOWERLINK_BUILD_TYPE STREQUAL "Link to Application")
