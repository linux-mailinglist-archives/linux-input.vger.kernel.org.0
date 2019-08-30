Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1F4A2B4D
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 02:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfH3AJx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 20:09:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37875 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfH3AJw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 20:09:52 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so2495870pgp.4
        for <linux-input@vger.kernel.org>; Thu, 29 Aug 2019 17:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t0jW8/Us4VDwZ2V77TTLKPa16hNXUOtsfbaPGg3ZDhw=;
        b=Pba1FDY0DbpbtRezgU72M8SapyeJPw6bRWJ7xPEnsNWPnBkSwSb0y7zyTVT7hQO9ZX
         1GgBEWpA3rso/TGVAyK+8CN9fpfSLxKbeDEoMD6Qdk+h0zgaz54hi0KI48gWlSoNraJ5
         Hf5SH+tjKmGTbMY9FKcZKupzVOFQDE8ti4MtPt7q5rgIuwrAiGf7LswmFZGyQgQEBAzz
         2c9A+9PZsRh1sIo9zhLQd/fLVP59fjx0aOuxcD3zY8/+mvf/bVo+Ytha55IhUnlg1YbI
         8ww8W3XpGgZkirionCX+lFXbjxBgo59v3nxk0448Kqv4vNmInhzCDnApMZrHEfSKpOPj
         0m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t0jW8/Us4VDwZ2V77TTLKPa16hNXUOtsfbaPGg3ZDhw=;
        b=DZA73LpxUYaec/5DM9jSJuO7LaW3h6zRIrFs162XGhBMWz6BXR8NYAMIuW2tNv+xxx
         SJk/WrdWGuwU5s2+fpwdfRFXm/JsnnXokg7OjHpAD5QUlIPh3djGAk4lPfuuleIiFADX
         nEcz+ZnT76ywcK3TSaL1aI319rQFb/pJQm7i6EwfgBE7Pv0VLRQGtXzQFoLEnR28fr5J
         PjMx+s8g56agatud8GzILI/HvikliCyODMh/np5EjrkzQN9CaOr8aj7U3kbCo064SmvX
         JTL6Y6ICuTMspwFdfletfDKMzK8ho+ZdvrhXLRqL9n4drgZKyVKP1k8KaR5tYn1Fj/DR
         qpLA==
X-Gm-Message-State: APjAAAWjQ45bYdwLBztD5rkL1WfJRHwEvp6DQmJf15rvdhCZjMOwzRGq
        dPVHR9LdBGzn9yPZ9KUHZATyZbJU
X-Google-Smtp-Source: APXvYqxtbrnM+w5qX6cPw8lZtUFEPtic81wUhvBFnXwYeF8dZj7C4pfoX6LLfeFJcysCd9Ti75wTHg==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr10587740pgv.437.1567123791674;
        Thu, 29 Aug 2019 17:09:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e66sm8769675pfe.142.2019.08.29.17.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 17:09:50 -0700 (PDT)
Date:   Thu, 29 Aug 2019 17:09:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Atif Niyaz <atifniyaz@google.com>, linux-input@vger.kernel.org,
        Alistair Delva <adelva@google.com>,
        Tom Gall <tom.gall@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Subject: Re: Possibly -next regression from "Input: allow drivers specify
 timestamp for input events"
Message-ID: <20190830000948.GF187474@dtor-ws>
References: <CALAqxLWRV2A3cGUgKfX2j1RPruESTqhG+stXCfrFTL8XaM4UWQ@mail.gmail.com>
 <20190829182244.GC187474@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829182244.GC187474@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 29, 2019 at 11:22:44AM -0700, Dmitry Torokhov wrote:
> Hi John,
> 
> On Tue, Aug 27, 2019 at 02:54:17PM -0700, John Stultz wrote:
> > Hey Atif,
> >   I was testing today's -next with AOSP on the HiKey board and was
> > seeing some odd mouse behavior and I've bisected the issue down to
> > commit 3b51c44bd693 ("Input: allow drivers specify timestamp for input
> > events").
> > 
> > In the logcat log I'd see a number of:
> >  I InputDispatcher: Dropped event because it is stale.
> > 
> > Usually it would seem like flings weren't really responding right, and
> > then the UI would basically freeze for awhile (even though the mouse
> > cursor could still move around, the UI was just ignoring new input).
> > 
> > Just skimming the patch, It seems like maybe we're hitting:
> > 
> > if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
> > 
> > check and the device timestamp (at least occasionally) isn't
> > zero/"invalid" but also isn't actually correct.
> > 
> > If I comment out that check, and always call input_set_timestamp(dev,
> > ktime_get()), the issue seems to go away.
> > 
> > Do you have any suggestions for me to try?
> 
> Ah, of course, once we hit it first time, we set the timestamp, and then
> it will become stale.
> 
> I guess we need zero-out the timestamp on input_sync(). Can you please
> try doing that?

Something like this maybe?

Input: reset device timestamp on sync

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

We need to reset input device's timestamp on input_sync(), otherwise
drivers not using input_set_timestamp() will end up with a stale
timestamp after their clients consume first input event.

Fixes: 3b51c44bd693 ("Input: allow drivers specify timestamp for input events")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 8d75c4098b13..35fcd495df3a 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -400,6 +400,13 @@ static void input_handle_event(struct input_dev *dev,
 		if (dev->num_vals >= 2)
 			input_pass_values(dev, dev->vals, dev->num_vals);
 		dev->num_vals = 0;
+		/*
+		 * Reset the timestamp on flush so we won't end up
+		 * with a stale one. Note we only need to reset the
+		 * monolithic one as we use its presence when deciding
+		 * whether to generate a synthetic timestamp.
+		 */
+		dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
 	} else if (dev->num_vals >= dev->max_vals - 2) {
 		dev->vals[dev->num_vals++] = input_value_sync;
 		input_pass_values(dev, dev->vals, dev->num_vals);

-- 
Dmitry
