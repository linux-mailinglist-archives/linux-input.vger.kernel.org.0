Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4044307F14
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 21:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhA1UCt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 15:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhA1UAk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 15:00:40 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ABAC06178C;
        Thu, 28 Jan 2021 11:54:38 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611863676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=9HND6RS6xGWx9b14oroKV6AbAvA8WEnG8PXrA56Lq8E=;
        b=gq/vEEpOy9fi9IRRJvQyC71duAyLnuKadJHMd2ViK2/u5Hf1E+eucj8facYi2x5JFg57eM
        Q1BmcVCPFLwex7pbSXJ2p/r0Vg9Iu6jUE8UeGuknXhmcKSHnV2yU6klZK7d5nFMdtavsvs
        yKPWL70MhV3HzSzNlrP5zSTe2P7oK+oGk5GBevv/9SYM7xMdohVoThzrs7draaGjiYNjFG
        seQZU3qPNAhj5RUaZy6SbTYtbz9MAz+VNcAFF0ilbjJeVnR2Gu4mwrK2DU93Qksan16FVN
        6knFrA3Z1bAhLSY1nbiTdd7hEToSFGe/I3KGRjwOP0v+9qLKpVlJhRxAK/iB+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611863676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=9HND6RS6xGWx9b14oroKV6AbAvA8WEnG8PXrA56Lq8E=;
        b=2Gzs4L2Mw/ok6mCuOvcd9UUGEordfF5v8yL5hsE44duh1naltMArJW0vF01Y8+EqC/OJBY
        NjpiYgRXJNiPq8AA==
To:     Barry Song <song.bao.hua@hisilicon.com>, dmitry.torokhov@gmail.com,
        maz@kernel.org, gregkh@linuxfoundation.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linuxarm@openeuler.org, Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v3 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
In-Reply-To: <20210107223926.35284-2-song.bao.hua@hisilicon.com>
Date:   Thu, 28 Jan 2021 20:54:36 +0100
Message-ID: <87k0rwdegz.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Barry,

On Fri, Jan 08 2021 at 11:39, Barry Song wrote:
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index ab8567f32501..2b28314e2572 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1693,6 +1693,9 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>  		}
>  
> +		if (new->flags & IRQF_NO_AUTOEN)
> +			irq_settings_set_noautoen(desc);

If we move this to request time flags, then setting the noautoen bit on
the irq descriptor is pretty pointless. See below.

I rather get rid of the irq_settings magic for NOAUTOEN completely.

Thanks,

        tglx
---
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -61,6 +61,8 @@
  *                interrupt handler after suspending interrupts. For system
  *                wakeup devices users need to implement wakeup detection in
  *                their interrupt handlers.
+ * IRQF_NO_AUTOEN - Don't enable IRQ automatically when users request it. Users
+ *                will enable it explicitly by enable_irq() later.
  */
 #define IRQF_SHARED		0x00000080
 #define IRQF_PROBE_SHARED	0x00000100
@@ -74,6 +76,7 @@
 #define IRQF_NO_THREAD		0x00010000
 #define IRQF_EARLY_RESUME	0x00020000
 #define IRQF_COND_SUSPEND	0x00040000
+#define IRQF_NO_AUTOEN		0x00080000
 
 #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
 
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1693,7 +1693,8 @@ static int
 			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 		}
 
-		if (irq_settings_can_autoenable(desc)) {
+		if (!(new->flags & IRQF_NO_AUTOEN) &&
+		    irq_settings_can_autoenable(desc)) {
 			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
 		} else {
 			/*
@@ -2086,10 +2087,15 @@ int request_threaded_irq(unsigned int ir
 	 * which interrupt is which (messes up the interrupt freeing
 	 * logic etc).
 	 *
+	 * Also shared interrupts do not go well with disabling auto enable.
+	 * The sharing interrupt might request it while it's still disabled
+	 * and then wait for interrupts forever.
+	 *
 	 * Also IRQF_COND_SUSPEND only makes sense for shared interrupts and
 	 * it cannot be set along with IRQF_NO_SUSPEND.
 	 */
 	if (((irqflags & IRQF_SHARED) && !dev_id) ||
+	    ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN)) ||
 	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
 	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
 		return -EINVAL;

