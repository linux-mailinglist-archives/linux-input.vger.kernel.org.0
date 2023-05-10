Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA036FE437
	for <lists+linux-input@lfdr.de>; Wed, 10 May 2023 20:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbjEJSvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 May 2023 14:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjEJSvo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 May 2023 14:51:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F6465A0
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 11:51:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2acb6571922so58537081fa.0
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 11:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683744692; x=1686336692;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFGqFppUzpxmVkjUZvC53QtHHywz1Qo6h6Pn4F/DeOo=;
        b=dRetkPZ+CeYM6y+N3A8Ue6DO/zDRu6faoqdZKsAf8J0KFGPmPjyIb/EaIzvvHRFc7i
         gRqproQ/h3YhAJewP4g9I0vsejKFo309PgYdV6Po+9PH+QxCEcEYV6wH/4rbzbRccguZ
         6lJcN2QJTjEmkQhVUIDgAwqEac85hDIektPK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683744692; x=1686336692;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFGqFppUzpxmVkjUZvC53QtHHywz1Qo6h6Pn4F/DeOo=;
        b=K2Lp20Hr2sYQyFp2SG8fVXEzeMF1uP3uLfeL1jwndvHcv4MYH+jl8YGns+ztzlIz1W
         rye+JwVEIkBnZiiE+7g6G4HzXEEuL5mtYlr/Z5P0iUC2RjihMxntDoCODPX+gXmOlaO6
         oadK/PaScO8HpeBdDy1IFX9gXBr4OExY1hTDzE1sSBe2clXaV0jhA/dt321IdvCm6Zae
         5LVCGRkdkROIIcCMhtRM8B2BRf3QU1FJJFsWZLfl9nL8DXWAQJ08Zx1iAExAAkHztTN/
         729cxH56GBye7z0uwJPZQm++Rhd1BjQSwLuJr5SG+z7ga2U9AWjMix0/jatfgHVfE/IE
         39cA==
X-Gm-Message-State: AC+VfDw9jzXSBQGIPh9ee0XhPHRVrsIYvX23KylzFhNjDo5Gw13d+dwa
        gbnvmVTThwXQswl5Q2vfWIdekXN50YRBQdrSB/7Gfg==
X-Google-Smtp-Source: ACHHUZ7cJmHdcg31stA7TUYM2h7LeBE8zcTDEECiPZW7O5XhIGQzsrGE5q/Ubu5bYuEnl7rZE2HLL97g1M62iyv0Swk=
X-Received: by 2002:a2e:878c:0:b0:2ad:8cc6:135a with SMTP id
 n12-20020a2e878c000000b002ad8cc6135amr2563024lji.33.1683744691683; Wed, 10
 May 2023 11:51:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 May 2023 11:51:31 -0700
MIME-Version: 1.0
In-Reply-To: <ZFWZ785FRHDii/+5@google.com>
References: <20230505232417.1377393-1-swboyd@chromium.org> <ZFWZ785FRHDii/+5@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 10 May 2023 11:51:31 -0700
Message-ID: <CAE-0n521MhmdWjEb0-xwnPLQz07bMCGyXokZ3L87azYcw6_C_Q@mail.gmail.com>
Subject: Re: [PATCH] HID: google: Don't use devm for hid_hw_stop()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2023-05-05 17:06:07)
> On Fri, May 05, 2023 at 04:24:16PM -0700, Stephen Boyd wrote:
> >
> ...
> > Unfortunately, the hid google hammer driver hand rolls a devm function
> > to call hid_hw_stop() when the driver is unbound and implements an
> > hid_driver::remove() function. The driver core doesn't call the devm
> > release functions until _after_ the bus unbinds the driver, so the order
> > of operations is like this:
>
> Excellent analysis, but the problem is not limited to the hammer driver
> (potentially) and shalt be dealt with appropriately, at the HID bus
> level.

Thanks. I thought of the bus level approach as well, but I was trying to
keep the fix isolated to the driver that had the problem. I'd like to
get the fix into the stable kernel, as this fixes a regression
introduced by commit d950db3f80a8 ("HID: google: switch to devm when
registering keyboard backlight LED") in v5.18.

Is the bus level approach going to be acceptable as a stable backport?

Is it a problem to call hid_hw_stop() directly? I suppose for the
hid-google-hammer driver we don't want to leave the led sysfs node
hanging around after the hid_hw_stop() function has been called either,
so some sort of forced ejection of the devm led device is needed and the
bus level approach helps there.

I was curious to see if anything else had this problem so I did this
poor grep to find code that isn't calling hid_hw_stop() from probe or
remove:

  git grep -W hid_hw_stop | grep .c= | grep -v probe | grep -v remove

and I got this list (minus hid core which doesn't matter):

 drivers/hid/hid-google-hammer.c=static void hammer_stop(void *hdev)
 drivers/hid/hid-mcp2221.c=static void mcp2221_hid_unregister(void *ptr)
 drivers/hid/hid-wiimote-core.c=static void wiimote_destroy(struct
wiimote_data *wdata)
 drivers/hid/wacom_sys.c=static int wacom_parse_and_register(struct
wacom *wacom, bool wireless)
 drivers/hid/wacom_sys.c=static void wacom_wireless_work(struct
work_struct *work)
 drivers/hid/wacom_sys.c=static void wacom_mode_change_work(struct
work_struct *work)

The wacom_sys.c ones look OK because they're during workqueues that are
probably flushed, and wiimote_destroy() is called from an error path or
driver remove, so it is also OK. But mcp2221_hid_unregister() has the
same problem.

If you look at drivers/hid/hid-mcp2221.c you'll see this comment above
mcp2221_remove() too:

 /* This is needed to be sure hid_hw_stop() isn't called twice by the
subsystem */
 static void mcp2221_remove(struct hid_device *hdev)

which is kinda weird. Why can't we have a devm_hid_hw_start() API that
tells the hid bus to not call hid_hw_stop() at all in
hid_device_remove()? That would allow us to avoid this pitfall where
everything is moved to devm and the driver has no remove function at all
and we forget to populate an empty one. Instead, the bus layer can know
that hardware will be stopped with devm later.

>
> Actually, it is not even limited to HID, but exists in most buses with
> non-trivial ->remove() implementation. For example I fixed similar issue
> in I2C in 5b5475826c52 ("i2c: ensure timely release of driver-allocated
> resources"). I tried fixing it in SPI but Mark has some objections, and
> wanted to fix it in the driver core, so I was thinking about it and then
> dropped the ball. At this time I do not think fixing it at driver core
> makes logic any clearer, so I think we just need to fix a handful of
> buses.

Do you have a link to that discussion?

-------

This got me thinking that maybe both of these approaches are wrong.
Maybe the call to hid_close_report() should be removed from
hid_device_remove() instead.

The device is being removed from the bus when hid_device_remove() is
called, but it hasn't been released yet. Other devices like the hidinput
device are referencing the hdev device because they set the hdev as
their parent. Basically, child devices are still bound to some sort of
driver or subsystem when the parent hdev is unbound from its driver,
leading to a state where the child drivers could still access the hdev
while it is being destroyed. If we remove the hid_close_report() call
from this function it will eventually be called by hid_device_release()
when the last reference to the device is dropped, i.e. when the child
devices all get destroyed. In the case of hid-google-hammer, that would
be when hid_hw_stop() is called from the devm release function by driver
core.

The benefit of this approach is that we don't allocate a devres group
for all the hid devices when only two drivers need it. The possible
downside is that we keep the report around while the device exists but
has no driver bound to it.

Here's a totally untested patch for that.

---8<----
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 22623eb4f72f..93905e200cae 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1211,8 +1211,8 @@ int hid_open_report(struct hid_device *device)
 		hid_parser_reserved
 	};

-	if (WARN_ON(device->status & HID_STAT_PARSED))
-		return -EBUSY;
+	if (device->status & HID_STAT_PARSED)
+		hid_close_report(device);

 	start = device->dev_rdesc;
 	if (WARN_ON(!start))
@@ -2662,7 +2662,6 @@ static void hid_device_remove(struct device *dev)
 			hdrv->remove(hdev);
 		else /* default remove */
 			hid_hw_stop(hdev);
-		hid_close_report(hdev);
 		hdev->driver = NULL;
 	}
