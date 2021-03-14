Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A4E33A358
	for <lists+linux-input@lfdr.de>; Sun, 14 Mar 2021 07:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbhCNGVk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Mar 2021 01:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhCNGVd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Mar 2021 01:21:33 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E95C061574;
        Sat, 13 Mar 2021 22:21:32 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id y67so4635294pfb.2;
        Sat, 13 Mar 2021 22:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RrrkK57SVof7cCIoYVao3xYsn5VmfEw1vg0WaKG+fgs=;
        b=JigH8S3oFOFS9eRz+PYOdbhCH5dA2y8MlLXwI3y6tGordxh0Yw8HK8bxQM7sXonwRf
         XNPPdM2HQRsmnOhS3olFyGetmG7bHTVbZokNaxtLGvvN9zFEoItOLMkITVkwpf0hAIhc
         hPR13i9vXEU+gd1OTjSp/EGEyfGGCzkPEJTTmYQ3kh9TaQVFbf/oLG2nlveQglOX3r+V
         /eZv/kF4/Op/2WwH3JsawbgEMb9wR6E8/LLQnkVuu3x/XzUv23eoXGHLN8OBssCCFc7G
         PkwXdn0ZG5kKUJR0aehE25T3vbbGtBnX80tvk4hPF80J6rgqBSkhR3lTPRsOzdX0JGzZ
         IfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RrrkK57SVof7cCIoYVao3xYsn5VmfEw1vg0WaKG+fgs=;
        b=QlCnN/c6m5c/hNLzVIKjjIzG8R711YLJhIa44PrYIZ11G/jq0cz8P697W8D8kRsNqV
         CHPWnyUJTlGExSxAORrtYOPcy9nbICCmFLCwTV0qTNtkNgPeGV1LSLDMqxogjUJ8Kjko
         J/81vv+1r9NJZWdSNWZFGL08CUvdnkQGNmUemtbsyQSZ0g8bapYM+eJijHwDMYwKm801
         ILF7KPwlFW0YeQmaOlfYSewdiUhq8JtCSKLrSASggdRC4FO2lIEABwEvpxmcVJN8MOru
         lvT2W0mA83aEVJ1Die3MPP1yZmxQ0Ck08CsZjoyNc8h9leKIfx59ZAMoCwEL+JbkNLWB
         peqg==
X-Gm-Message-State: AOAM5321S8WeQDOM2FvFHSFm0QuW0v9OMS3BbH/SYRzFsU1FiIp98IxX
        KcL+MyVK+JDx3ktiAGE1a7I=
X-Google-Smtp-Source: ABdhPJz5jNw+irfrobMywTp0/W0q/aiCLTmPzWVirbSIRA2Td1RvwFTPLacl6Uer+fVNmueogfg+YA==
X-Received: by 2002:aa7:850a:0:b029:1fc:ccaf:5d5c with SMTP id v10-20020aa7850a0000b02901fcccaf5d5cmr5446701pfn.80.1615702891667;
        Sat, 13 Mar 2021 22:21:31 -0800 (PST)
Received: from google.com ([2620:15c:202:201:6c60:d3e8:43bd:2b3a])
        by smtp.gmail.com with ESMTPSA id v26sm9546942pff.195.2021.03.13.22.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 22:21:30 -0800 (PST)
Date:   Sat, 13 Mar 2021 22:21:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/9] Input: iqs5xx - prevent interrupt storm during
 removal
Message-ID: <YE2rZycxR6elopon@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-7-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-7-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Sat, Mar 13, 2021 at 01:12:33PM -0600, Jeff LaBundy wrote:
> Unsolicited I2C communication causes the device to assert an interrupt; as
> such the IRQ is disabled before any registers are written in iqs5xx_open()
> and iqs5xx_close().
> 
> After the driver is unloaded, however, i2c_device_remove() sets the IRQ to
> zero before any handlers may call input_close_device() while the device is
> unregistered. This keeps iqs5xx_close() from disabling the IRQ, leading to
> an interrupt storm during removal.
> 
> Placing input_register_device() in front of devm_request_threaded_irq() to
> free the IRQ before iqs5xx_close() is called does not cover the case where
> firmware is updated at the factory and the input device is registered well
> after the driver has already probed.
> 
> The solution, therefore, is to remove the open and close callbacks as they
> do not buy much in the first place. The device already starts in an active
> state, then drops into a low-power mode based on activity.

No, this is not the proper solution. We should rather fix i2c bus (and
really all the other buses with non-trivial probe and remove) so that it
is compatible with devres/devm. I wanted to do this for a while and I
guess we really need this. Could you please try the patch below and see
if it fixes your issue?

Thanks.

-- 
Dmitry


i2c: ensure timely release of driver-allocated resources

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

More and more drivers rely on devres to manage their resources, however if
bus' probe() and release() are not trivial and control some of resources as
well (for example enable or disable clocks, or attach device to a power
domain, we need to make sure that driver-allocated resources are released
immediately after driver's remove() method returns, and not postponed until
driver core gets around to releasing resources. To fix that we open a new
devres group before calling driver's probe() and explicitly release it when
we return from driver's remove().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/i2c-core-base.c |   19 ++++++++++++++++++-
 include/linux/i2c.h         |    3 +++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..b8a96db2c191 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -518,6 +518,11 @@ static int i2c_device_probe(struct device *dev)
 	if (status)
 		goto err_clear_wakeup_irq;
 
+	client->devres_group_id = devres_open_group(&client->dev, NULL,
+						    GFP_KERNEL);
+	if (!client->devres_group_id)
+		goto err_detach_pm_domain;
+
 	/*
 	 * When there are no more users of probe(),
 	 * rename probe_new to probe.
@@ -530,11 +535,21 @@ static int i2c_device_probe(struct device *dev)
 	else
 		status = -EINVAL;
 
+	/*
+	 * Note that we are not closing the devres group opened above so
+	 * even resources that were attached to the device after probe is
+	 * run are released when i2c_device_remove() is executed. This is
+	 * needed as some drivers would allocate additional resources,
+	 * for example when updating firmware.
+	 */
+
 	if (status)
-		goto err_detach_pm_domain;
+		goto err_release_driver_resources;
 
 	return 0;
 
+err_release_driver_resources:
+	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
 	dev_pm_domain_detach(&client->dev, true);
 err_clear_wakeup_irq:
@@ -563,6 +578,8 @@ static int i2c_device_remove(struct device *dev)
 			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(status));
 	}
 
+	devres_release_group(&client->dev, client->devres_group_id);
+
 	dev_pm_domain_detach(&client->dev, true);
 
 	dev_pm_clear_wake_irq(&client->dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..5d1f11c0deaa 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -306,6 +306,8 @@ struct i2c_driver {
  *	userspace_devices list
  * @slave_cb: Callback when I2C slave mode of an adapter is used. The adapter
  *	calls it to pass on slave events to the slave driver.
+ * @devres_group_id: id of the devres group that will be created for resources
+ *	acquired when probing this device.
  *
  * An i2c_client identifies a single device (i.e. chip) connected to an
  * i2c bus. The behaviour exposed to Linux is defined by the driver
@@ -334,6 +336,7 @@ struct i2c_client {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
+	void *devres_group_id;		/* ID of probe devres group	*/
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
