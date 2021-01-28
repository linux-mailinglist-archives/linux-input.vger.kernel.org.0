Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B786F307706
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 14:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhA1N0u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 08:26:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53823 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhA1N0s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 08:26:48 -0500
Received: from [172.23.56.21] ([82.207.216.72]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M72wT-1l3idD3sUR-008XMc; Thu, 28 Jan 2021 14:24:09 +0100
Message-ID: <b28ecd90eb0a58cbd07c434272244a4aa9581c7b.camel@richard-neumann.de>
Subject: Re: [PATCH 0/3] AMD_SFH: Allow overriding sensor-mask by
 module-param or DMI-quirk
From:   Richard Neumann <mail@richard-neumann.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     linux-input@vger.kernel.org
Date:   Thu, 28 Jan 2021 14:24:07 +0100
In-Reply-To: <20210128121219.6381-1-hdegoede@redhat.com>
References: <20210128121219.6381-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UE9NP0pdY4UYMMAstEq4X+GVF4VlTcOCnH9T2lvRWJKM71aq51f
 cLNX9uqwlMUAqYWvv9RINWwCJoIXg+BFx+tEAF57ZLwrLbWSyV5ZkF+dpx+1aUg7+EeFmzy
 B4Af0TprlqgCSk8RDaPL9fFR/Vg2eiv1zOBDOVHV7TddmtmlqJ0QyIFHGQVisHFdj+XxEVs
 0gcvCIBbVXfNJateF891w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zhVKJGrDmUg=:x4Po8GHqD6ybzpEn4OkFZd
 V5Du9k89GJ39JJqRRDIs/h2pzCLfpLCSv9fvkPnRdRh05UNOzUCinAGynT1NaV9BNb5IG11Ez
 a2P0V/PZ54pvzAIIebMugHQb3nxWsoVAUt11wYXlE/f4N1uniP2mq0KTFt3EwrzNQ3xhNOKCA
 5fV6fqsKnzPmgYs5k1nYcUcPSKbnHbPHTBm3deCeMV/GSnCCLpN1stclt7GDRnSF/cpKopuVU
 hDw6HI8ZbwyaHF/f41BbKZxlylIag8Z7Ngjkg7p/1aoLmGHWv/Y5Bm/fGafeU/xRaVbBww+V8
 Q9m1r1RnMQ/Rv4G3vYXADr1sQO9AGlnowv9P6brkDJBIV/ZXNHvUFEhJadceGlkXLRYzAC5YY
 HqPFB8dg6nac6xtg1sjS79/sAFuua7hZweOel2RaEskK6mJA7Zky8bZQLiJByB5bCq9vZOY6e
 N3+4ea96Cw==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

sorry, I missed to include you in the recipients of the patch I
submitted yesterday: 
https://patchwork.kernel.org/project/linux-input/list/?series=423055

I was focused on the recipient returned by the get_maintainer.pl
script.
My patch, however, does the DMI matching a little differently and does
not utilize the driver_data field of the DMI IDs.
Also I did not include a patch to add a module parameter.

I have too few knowledge which one is better. I don't think that we
need the module parameter right now, if we have the DMI quirks, but
I'll leave this decision to the experts.

It is true, that my fully refactored patch will need more review, and I
changed some things already since I submitted it. But I will wait for
some comments before I consider submitting it again.

Kind regards,

Richard

Am Donnerstag, dem 28.01.2021 um 13:12 +0100 schrieb Hans de Goede:
> Hi All,
> 
> There are several bug-reports about the new AMD_SFH driver not
> working
> on various HP ENVY x360 Convertible models. The problem is that the
> driver expects the BIOS to program which sensors are present into the
> active bits of the AMD_P2C_MSG3 register; and the BIOS on these
> models
> does not do this:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=199715
> https://bugzilla.redhat.com/show_bug.cgi?id=1651886
> 
> This patch-set adds a module-parameter + DMI-quirk mechanism to
> override
> the settings read back from the AMD_P2C_MSG3 register, to work around
> this problem. The DMI-quirk table is populated with 2 HP ENVY x360
> Convertible models which are know to need this workaround.
> 
> There also is a much larger refactoring patch-set pending from
> Richard Neumann, who is also involved in the bugzilla.kernel.org bug.
> 
> But it looks to me like that will need a bit more more work before
> it is ready for merging, where as (IMHO) this set is ready for
> merging now. So IMHO it would be good to first merge this patch-set
> to get this fix into the hands of end-users of these devices.
> 
> Note there still is an open issue on these devices where the
> sensors stop working after a suspend/resume cycle.
> 
> I wonder if the driver should perhaps not only not use the
> active bits of the AMD_P2C_MSG3 register for determining which
> sensors are there, but if it should actually write to those bots
> with the correct settings.
> 
> Sandeep, do you have any ideas what might be the problem here?
> Should I ask the reporters to test a patch which actually
> updates the active bits?
> 
> Regards,
> 
> Hans
> 
> 
> 
> Hans de Goede (3):
>   AMD_SFH: Removed unused activecontrolstatus member from the
>     amd_mp2_dev struct
>   AMD_SFH: Add sensor_mask module parameter
>   AMD_SFH: Add DMI quirk table for BIOS-es which don't set the
>     activestatus bits
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 40
> ++++++++++++++++++++++++--
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  1 -
>  2 files changed, 37 insertions(+), 4 deletions(-)
> 


