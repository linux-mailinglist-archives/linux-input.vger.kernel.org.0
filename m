Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EB44B42E9
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 08:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiBNHfS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 02:35:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241418AbiBNHfR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 02:35:17 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36081593BE;
        Sun, 13 Feb 2022 23:35:10 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w10so7030700edd.11;
        Sun, 13 Feb 2022 23:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPMoOiTX8uhktr57VJs3WIaSpE/usyir89O3lLj+lKA=;
        b=miBQct4ykY+vbmEVJ64ZeI4mok/yeMfTa5Xgg7xNSKl+cgHF75goZ5BxPCX+RUSfQ/
         Wxk5D+4/MCGOwQsFh5tiRbQAIkDJ0a0D2wtae6kCEhzLu/oG34Jq39De+biMGaGFCNUe
         hCwVjtEjSlMbM8PyiViG0L1eBrnNnKabGzPOq8i+bHTVYKeR+mxx4y3XkM4svzzv1Yl8
         zIBmOh++lHDPJCVkiZJHR2LiWlp7Kz9QiTfgqjTG7iTUFHQM8cncagV7iKIQJanGAl0c
         lA2OmufbKW9aA4qdzb1UDmRTSeV9eCB5LVVDDX8J6TT07GHgqouYpa9LP3CyoraqxkDl
         8ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPMoOiTX8uhktr57VJs3WIaSpE/usyir89O3lLj+lKA=;
        b=1A9k4cHxWBNu6b6TW1AnUkejkllyL1LQF9ZNUEDRBYUcaEi2x7+Z4sbRCCLHdJGe/B
         KGtpnKBdZrJlKl+100F3+emEdrW2KByqW3TtcFmKPCG+5ktlAFbBOHzPQIiMnNfj9Ui1
         lpvZlS2BTqdDQ90t/QHe3E8x86TfOgAuXHucDueJKWyaFzb29QvDIuCkci8hq8JkwT23
         1k3ngGhtyWmtwM2AK0rhe41km1X/msflxDTFGry+7+n3xD0tNMNPtoCbAXciMG8/SRRJ
         JBxQbEtRDk6deQ6JkBHJNZ0j5nkL12AadVKATtFcI2KWykvwTamb1CJwla01dXqP8ARo
         6q0Q==
X-Gm-Message-State: AOAM533iXc5CG5NA7jfqNFFywKo7u6KJ6PZ0DrwPNeTxN2SNmPnHEh4b
        qwhx/lM7+WhbIUS/uVwTNdGmohqIRxVBhx3sxhE=
X-Google-Smtp-Source: ABdhPJzVjvVy2RBbYtMO6kXM3DtAJlx+UtHI76se4RaET7nGGx2WdsjvO8lSyEYHvdI9UVvgWeYlIaDGAxmpVyfr8iA=
X-Received: by 2002:a05:6402:4254:: with SMTP id g20mr14572669edb.281.1644824108676;
 Sun, 13 Feb 2022 23:35:08 -0800 (PST)
MIME-Version: 1.0
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu> <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
In-Reply-To: <YgcSbUwiALbmoTvL@rowland.harvard.edu>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 14 Feb 2022 15:34:42 +0800
Message-ID: <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 12, 2022 at 9:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Syzbot identified a refcount leak in the hid-elo driver:
>
> BUG: memory leak
> unreferenced object 0xffff88810d49e800 (size 2048):
>   comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
>   hex dump (first 32 bytes):
>     ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
>     00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
>   backtrace:
>     [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
>     [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
>     [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
>     [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
>     [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
>     [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
>     [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
>     [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
>     [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
>     [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
>     [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
>
> Not shown in the bug report but present in the console log:
>
> [  182.014764][ T3257] elo 0003:04E7:0030.0006: item fetching failed at offset 0/1
> [  182.022255][ T3257] elo 0003:04E7:0030.0006: parse failed
> [  182.027904][ T3257] elo: probe of 0003:04E7:0030.0006 failed with error -22
> [  182.214767][ T3257] usb 1-1: USB disconnect, device number 7
> [  188.090199][ T3604] kmemleak: 3 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> BUG: memory leak
>
> which points to hid-elo as the buggy driver.
>
> The leak is caused by elo_probe() failing to release the reference it
> holds to the struct usb_device in its failure pathway.  In the end the
> driver doesn't need to take this reference at all, because the

Hi Alan,

My patch "[PATCH] hid: elo: fix memory leak in elo_probe" is merged
several weeks ago.

However, I fix this bug by modifying the error handling code in
elo_probe. If you think the refcount is not necessary, maybe a new
patch to remove the refcount is better.

> elo_priv structure is always deallocated synchronously when the driver
> unbinds from the interface.
>
> Therefore this patch fixes the reference leak by not taking the
> reference in the first place.
>
> Reported-and-tested-by: syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>
>
> ---
>
>
> [as1971]
>
>
>  drivers/hid/hid-elo.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> Index: usb-devel/drivers/hid/hid-elo.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-elo.c
> +++ usb-devel/drivers/hid/hid-elo.c
> @@ -239,7 +239,7 @@ static int elo_probe(struct hid_device *
>
>         INIT_DELAYED_WORK(&priv->work, elo_work);
>         udev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
> -       priv->usbdev = usb_get_dev(udev);
> +       priv->usbdev = udev;
>
>         hid_set_drvdata(hdev, priv);
>
> @@ -270,8 +270,6 @@ static void elo_remove(struct hid_device
>  {
>         struct elo_priv *priv = hid_get_drvdata(hdev);
>
> -       usb_put_dev(priv->usbdev);
> -
>         hid_hw_stop(hdev);
>         cancel_delayed_work_sync(&priv->work);
>         kfree(priv);
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/YgcSbUwiALbmoTvL%40rowland.harvard.edu.
