Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20753D176E
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 22:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239918AbhGUTNG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 15:13:06 -0400
Received: from outgoing-yousee-5.gl-mut-gbl.as8677.net ([193.201.76.65]:43784
        "EHLO outgoing-yousee-5.gl-mut-gbl.as8677.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239940AbhGUTNG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 15:13:06 -0400
Received: from filter.yousee.as8677.net (localhost [127.0.0.1])
        by mwumf0307.yousee.as8677.net (SMTP Server) with ESMTP id 4GVR912VFDz18VjGm
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 21:53:41 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVR912Dz6z18VjGl","contextId":"6db16247-f9f8-4d73-80af-aa64aeacc425"}
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=webspeed.dk; s=sela;
 t=1626897221; h=Subject:From:To:Cc:Date:In-Reply-To:References; bh=OyEduCtD3O
  PcZ1Sy6j98geRnhOnIf3kh7hB7V+qZmL8=; b=DKUjLQTI3uOncG17HQamjPqtHs7XQ2QlYs3Cnj
  sc6o4nTC42n5CRyoNVCecES3VlDdIsVjwOZJSkyh/ZvEeP83zmyGdLqF7NDYjNsSRVjfHdcIHuqb
  2rwfT6XtERoy7bHtc3EiqPBTRCxBC62hOagOVykpRJ26x8Fs1Xj9hF5cyrX9BFk1sPVrHrTiDbc+
  V/NMwZqvFA5p8UF89D0PnSkdgl8WerG2v56LBP1DBweerqYowCIVbPfAemSJf0WimcP3wYj1czke
  5+Imd6JOZgzNmTznpPbHIoOfo1l+1aW/VFqMU+rWntvrAjwpqhaSlR4793Rhk3vS7JQ+u8ZKSH7Q
  ==
Received: from outgoing-yousee-5.gl-mut-gbl.as8677.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mwumf0307.yousee.as8677.net (SMTP Server) with ESMTPS id 4GVR912Dz6z18VjGl
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 21:53:41 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVR910gspz18VjGc","contextId":"c8254987-9df3-4159-a292-49d4eab7d6aa"}
X-yse-mailing: LEGIT
X-yse-spamrating: 36
X-yse-spam: not-spam
X-yse-spamcause: OK, (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvfffvedpggftfgfpufgfuefuveftkfeugfdpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepjfgrnhhsucfutghhuhhlthiiuceohhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkqeenucggtffrrghtthgvrhhnpeehueehudeufedvjefftdettdejudfgkeehueeuieejiefgvdekjeeljeejuedvvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedvrddutdegrdduudeirddukeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddurddvfeegngdpihhnvghtpedvrddutdegrdduudeirddukeegpdhmrghilhhfrhhomhephhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Received: from [192.168.1.234] (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hans.schultz@webspeed.dk)
        by mwumf0307.yousee.as8677.net (SMTP Server) with ESMTPSA id 4GVR910gspz18VjGc;
        Wed, 21 Jul 2021 21:53:41 +0200 (CEST)
Authentication-Results: yousee.as8677.net; auth=pass (PLAIN) smtp.auth=hans.schultz@webspeed.dk
Message-ID: <8ea9fed2bbe1c1e23afa3103177511c9501ee580.camel@webspeed.dk>
Subject: Re: Elantech touchpad not working on mainline kernels
From:   Hans Schultz <hans.schultz@webspeed.dk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Date:   Wed, 21 Jul 2021 21:51:52 +0200
In-Reply-To: <578761643e8a040fc1952ed1701371be15cb267a.camel@webspeed.dk>
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
         <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
         <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
         <CAKdAkRT=O5f7=bCOKUea0LDQnEUtV8Mu0yMbQNTcoB+7Q_3GNA@mail.gmail.com>
         <578761643e8a040fc1952ed1701371be15cb267a.camel@webspeed.dk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2021-07-21 at 21:31 +0200, Hans Schultz wrote:
> Hi Dmitry,
> 
> On Wed, 2021-07-21 at 12:14 -0700, Dmitry Torokhov wrote:
> > On Wed, Jul 21, 2021 at 11:09 AM Hans Schultz <
> > hans.schultz@webspeed.dk> wrote:
> > > 
> > > On Wed, 2021-07-21 at 10:48 -0700, Dmitry Torokhov wrote:
> > > > Hi Hans,
> > > > 
> > > > On Sun, May 30, 2021 at 2:12 AM Hans Schultz <
> > > > hans.schultz@webspeed.dk> wrote:
> > > > > 
> > > > > Hello,
> > > > > I have a problem getting my Elantech touchpad to work with
> > > > > the
> > > > > mainline
> > > > > kernels, and I need some assistance with the code to resolve
> > > > > the
> > > > > problem.
> > > > > The kernels that have tried are 5.9.11 and 5.11.11.
> > > > > 
> > > > > With boot parameters i8042.notimeout i8042.nomux, the
> > > > > touchpad is
> > > > > detected but does not work. There is absolutely no response
> > > > > from
> > > > > it
> > > > > with any hid modules loaded.
> > > > > 
> > > > > It is reported and seen working on a Lubuntu distro (bionic
> > > > > kernel)
> > > > > when inserting the i2c_hid module. The insertion of the
> > > > > i2c_hid
> > > > > module
> > > > > pulls in the hid_multitouch module when it works, no boot
> > > > > parameters
> > > > > necessary.
> > > > > In the case where it does not work, insering the i2c_hid
> > > > > module
> > > > > does
> > > > > not pull in the hid_multitouch module.
> > > > > 
> > > > > I have the bionic kernel code, but I have not as of yet been
> > > > > able
> > > > > to
> > > > > detect what makes it work in contrast to the kernel.org
> > > > > kernels.
> > > > > 
> > > > > This I think should lead to a kernel patch.
> > > > 
> > > > There is not much to go on with. What is the hardware, your
> > > > kernel
> > > > .config, dmesg from unsuccessful boot? If you have logs from
> > > > the
> > > > working kernel that would help too.
> > > > 
> > > > Thanks.
> > > > 
> > > 
> > > The best info I have on the hardware is from Xorg log with the
> > > working
> > > Lubuntu kernel:
> > > [ 130.980] (II) Loading
> > > /usr/lib/xorg/modules/input/synaptics_drv.so
> > > [ 130.982] (II) Module synaptics: vendor="X.Org Foundation"
> > > [ 130.982] (II) Using input driver 'synaptics' for '0X45 0X4C
> > > 0X41
> > > 0:00
> > > 04F3:308C Touchpad'
> > > 
> > > I might be able to get the kernel messages when inserting the
> > > working
> > > module, but I think it will not tell much more.
> > 
> > OK, if you say so. Then the only suggestion I have is to verify
> > that
> > your kernel config enables all necessary options for your hardware.
> > I'd double check if you have Designware I2C controller enabled,
> > ACPI
> > LPSS, etc.
> > 
> > > To me it is clearly a code issue as the working kernel pulls in
> > > hid_multitouch when inserting i2c_hid, while the non-working does
> > > not.
> > > 
> > > All kernels I have tried up to now from kernel.org do not work.
> > > The
> > > latest being 5.13.4.
> > 
> > Thanks.
> > 
> 
> I have a thread with all the dmesg info for both the working and non-
> working cases here :
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/544
> 
> Benjamin has also asked for the acpidump info, which is there. (funny
> as the responses to my problem come at the same time after a long
> time.
> :-) )
> 
> I will check my .config...
> 
> Thanks,
> Hans

Here are my I2C kernel settings. I only added what I could see as with
Intel hw, so no Designware!

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support
