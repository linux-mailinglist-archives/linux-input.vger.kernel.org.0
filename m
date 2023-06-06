Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248D7725053
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 00:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239768AbjFFW5a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 18:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237868AbjFFW53 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 18:57:29 -0400
Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C6AE70;
        Tue,  6 Jun 2023 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3GMQJPr3wLU/UltjLZBO4G3VQB7dUs9gh+yxdJxZDCM=; t=1686092245; x=1686956245; 
        b=IZUznDsn7NiHZXezCwKABLmyDehvNeokHWBqzIHLE4RG1P+OmRRgj5XHDCGtifBUyAap/KRW5x3
        PGBF5jnwrIzFNIH4yxkYXfpXoqXuX9Re7SaYIxubRQS3VyYExvQno6yOA0EknU2Ku4VCV/Tu9+xyG
        p+mZ7W02uijeF0bfaNFba8+8gtZZ31xAYyH6rpwK5FE8JIZmtXnOWdorXP7AKcHbKuNspKFMhquhB
        P1okkFoMfxPjBIH1eywEl2PfOS5vkQKvxXxmiuL2fYbLATuqPGKf34QIx2no1sWFq+Y5BAdBfL78T
        gRbc4cVeGxwct+00yh2sibvsfkt5HJlgiHaQ==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
        by mail.blnma.de with esmtp (Exim 4.96)
        (envelope-from <malte@starostik.de>)
        id 1q6fbx-000Ead-1z;
        Tue, 06 Jun 2023 22:57:09 +0000
Received: from zen.localnet ([85.183.148.49])
        by mail.blnma.de with ESMTPSA
        id Hn0FDMS5f2SSVQAA399c4A
        (envelope-from <malte@starostik.de>); Tue, 06 Jun 2023 22:57:08 +0000
From:   Malte Starostik <malte@starostik.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
        linux-input@vger.kernel.org, linux@hexchain.org,
        stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date:   Wed, 07 Jun 2023 00:57:07 +0200
Message-ID: <5980752.YW5z2jdOID@zen>
In-Reply-To: <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com>
References: <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Dienstag, 6. Juni 2023, 17:25:13 CEST schrieb Limonciello, Mario:
> On 6/6/2023 3:08 AM, Benjamin Tissoires wrote:
> > On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> >>>> Hello,
> >>>> 
> >>>> chiming in here as I'm experiencing what looks like the exact same
> >>>> issue, also on a Lenovo Z13 notebook, also on Arch:
> >>>> Oops during startup in task udev-worker followed by udev-worker
> >>>> blocking all attempts to suspend or cleanly shutdown/reboot the
> >>>> machine

> > I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors
> > are enabled, clean up") because the stack trace says that there is a bad
> > list_add, which could happen if the object is not correctly initialized.
> > 
> > However, that commit was present in v6.2, so it might not be that one.
> > 
> If I'm not mistaken the Z13 doesn't actually have any
> sensors connected to SFH.  So I think the suspicion on
> 7bcfdab3f0c6 and theory this is triggered by HID init makes
> a lot of sense.
> 
> Can you try this patch?
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index d9b7b01900b5..fa693a5224c6 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
> *privdata)
>                          devm_kfree(dev, cl_data->report_descr[i]);
>                  }
>                  dev_warn(dev, "Failed to discover, sensors not enabled
> is %d\n", cl_data->is_any_sensor_enabled);
> +               cl_data->num_hid_devices = 0;
>                  return -EOPNOTSUPP;
>          }
>          schedule_delayed_work(&cl_data->work_buffer,
> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));

I applied this to 9e87b63ed37e202c77aa17d4112da6ae0c7c097c now, which was the 
origin when I started the whole bisection. Clean rebuild, issue still 
persists.

Out of 50 boots, I got:

25 clean
22 Oops as posted by the OP
1 same Oops, followed by a panic
1 lockup [1]
1 hanging with just a blank screen

Not sure whether the lockups are related, but [1] mentions modprobe and udev-
worker as well and all problems including the blank screen one appear roughly 
at the same time during boot. As this is before a graphics mode switch, I 
suspect the last mentioned case may be like [1] while the screen was blanked.
To support the timing correlation: the UVC error for the IR cam shown in the 
photo (normal boot noise) also appears right before the BUG in the non-lockup 
bad case.

I do see the dev_warn in dmesg, so the code path modified in your patch is 
indeed hit:
[   10.897521] pcie_mp2_amd 0000:63:00.7: Failed to discover, sensors not 
enabled is 1
[   10.897533] pcie_mp2_amd: probe of 0000:63:00.7 failed with error -95

BR Malte

[1] https://photos.app.goo.gl/2FAvQ7DqBsHEF6Bd8


