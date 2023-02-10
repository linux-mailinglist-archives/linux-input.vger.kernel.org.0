Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97560692149
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 15:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbjBJO7q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 09:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjBJO7l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 09:59:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90350301BC
        for <linux-input@vger.kernel.org>; Fri, 10 Feb 2023 06:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676041114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TtIoamazjUK95m2+XF2UIf7KFJy6XAxCOBciAcuNvB4=;
        b=NW4kSuDMsmoSjbH/dqPT3gUdBMgFHD90xmQBFt45p0+hoRxhZ9OM+Kbrekks3mJxm5N3GS
        nExGvNZpVifo+/GNp2lOW+YACwxd1r7QGvpsD72HSwPBHrpk/pofmvurN23b/F/UHuC3Wm
        Y7Zx017zy/IXu7AbxY7ZE+94Uad+KeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-yTlxKmzuMeiRrDx5AiM0cg-1; Fri, 10 Feb 2023 09:58:28 -0500
X-MC-Unique: yTlxKmzuMeiRrDx5AiM0cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D30CD886464;
        Fri, 10 Feb 2023 14:58:27 +0000 (UTC)
Received: from mail.corp.redhat.com (ovpn-195-1.brq.redhat.com [10.40.195.1])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EF7E6404CD8F;
        Fri, 10 Feb 2023 14:58:14 +0000 (UTC)
Date:   Fri, 10 Feb 2023 15:58:12 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Pietro Borrello <borrello@diag.uniroma1.it>
Cc:     Jiri Kosina <jikos@kernel.org>, Hanno Zulla <kontakt@hanno.de>,
        Carlo Caione <carlo@endlessm.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
Message-ID: <20230210145812.gbsxqp2mimgcuahr@mail.corp.redhat.com>
References: <20230125-hid-unregister-leds-v3-0-0a52ac225e00@diag.uniroma1.it>
 <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Feb 09 2023, Pietro Borrello wrote:
> Use spinlocks to deal with workers introducing a wrapper
> asus_schedule_work(), and several spinlock checks.
> Otherwise, asus_kbd_backlight_set() may schedule led->work after the
> structure has been freed, causing a use-after-free.
> 
> Fixes: af22a610bc38 ("HID: asus: support backlight on USB keyboards")
> Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
> ---
>  drivers/hid/hid-asus.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index f99752b998f3..30e194803bd7 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -98,6 +98,7 @@ struct asus_kbd_leds {
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> +	spinlock_t lock;
>  	bool removed;
>  };
>  
> @@ -490,13 +491,23 @@ static int rog_nkey_led_init(struct hid_device *hdev)
>  	return ret;
>  }
>  
> +static void asus_schedule_work(struct asus_kbd_leds *led)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	if (!led->removed)
> +		schedule_work(&led->work);
> +	spin_unlock_irqrestore(&led->lock, flags);
> +}
> +
>  static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  				   enum led_brightness brightness)
>  {
>  	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
>  						 cdev);
>  	led->brightness = brightness;
> -	schedule_work(&led->work);
> +	asus_schedule_work(led);
>  }
>  
>  static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> @@ -512,15 +523,17 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>  	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
> +	unsigned long flags;
>  
> -	if (led->removed)
> -		return;
> +	spin_lock_irqsave(&led->lock, flags);
>  
>  	buf[4] = led->brightness;
>  
>  	ret = asus_kbd_set_report(led->hdev, buf, sizeof(buf));
>  	if (ret < 0)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> +
> +	spin_unlock_irqrestore(&led->lock, flags);

Same as in 1/2, please only keep "buf[4] = led->brightness;" under
spinlock.

Which also raises the question on why the other accesses of
led->brightness are not protected by the spinlock :)

Note that we could use an atomic to not use the spinlock, but we need
the spinlock anyway...

Cheers,
Benjamin

>  }
>  
>  /* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> @@ -584,6 +597,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
>  	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
>  	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> +	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
>  	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
>  	if (ret < 0) {
> @@ -1119,9 +1133,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  static void asus_remove(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> +	unsigned long flags;
>  
>  	if (drvdata->kbd_backlight) {
> +		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>  		drvdata->kbd_backlight->removed = true;
> +		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
> +
>  		cancel_work_sync(&drvdata->kbd_backlight->work);
>  	}
>  
> 
> -- 
> 2.25.1
> 

