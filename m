Return-Path: <linux-input+bounces-16850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A41CFF564
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 19:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 042A33009C30
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 18:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C355350A11;
	Wed,  7 Jan 2026 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYOkRv1b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28F3502B7
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809679; cv=none; b=dmLcr0VavPfDJO0HUk1vERjyQ3CBxAD+VAjY11e+AqDvyJ/s8JGRsQq1lsHtC9XYNjfY/BsihvoGW5RE8BUcuhy59/5y+QZxqde8NvDVs7HI6GFhPiAhfrMg4OkaSjBoeT25GBxg7xLDc1aV20v1CLBvbnNFlHMbj0LwPtfTVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809679; c=relaxed/simple;
	bh=8EJWSyxXvZn3ks3drvaQ+EJ2owoDHVGaxI97nir3IQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suz4mbX5A7OaUYWr2vuVM2zhNVaaqMF22tuPgX+3mE8Ehl+uQ2edJSXqGC0yXcPsH3Jno/Dw1y62EmwI51lRsLHjWVgjyTSR6qxJYHxFXXEWTgngTgkd8UFxPvOEHa1uHXJJeRU3B28jtvpOQX5P/V8x/emHdfpFWt3bbnGqk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYOkRv1b; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1824215a91.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809678; x=1768414478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe39Iqhf1BjF3qspe6gNWmMU2hyiA6KzHQi/Ut/Amjo=;
        b=HYOkRv1b3W2jJGx5ktZY/Q5lP754UqN7yBE0Gqaj+HTyJfbVPJVcIcAUI4v+Tf6Kwf
         fu0hxx+rC90+alrqaUxxn/0tDIwQ4kkEGecG2l48gW3u+gm/6BdVNmYvpeUObiipbTBY
         XsPpZ9CZFO8O6NAg77T8LwBIVtmKSYzg5kJNq0P6kcEQ5tWv6GRLylWioUINMaM8EPV2
         xhhPpzT0AHxtOAtQWi9NV+ycOMHPy/nyIVQgufQ8k71tMbMqNcGyJh3BaUGsvcZfaXrI
         a4fNUiMJJ7bUhF5yGKRbGjGPBtr/Ve4JerJlNZxhIAf1t4Ze0IFNb/l38rhEXdJSDTpD
         jZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809678; x=1768414478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe39Iqhf1BjF3qspe6gNWmMU2hyiA6KzHQi/Ut/Amjo=;
        b=KuY3uLR8phV0eAfIX695jkoV1i5VjJ5Iu/CmNpNjSObFUtUyp/CjIMJnXJjtkLQ1F8
         R5HC+xLrKdvXN9mk/HFB/DU3ZK0VmT7jisj1icubCat62ZdurOcH6BrtVmj2aBcmh/Vh
         9XPbkFIhwQEoOnDayqGsEIwAnchvUitv3w5k1zPxFT7nftdArimQqcJWe/D3BrQFw82r
         aUkc1eTygJKU0C7VHSbi7jaBpdQ4q93Ip7NVeW20jD39183E5m/gYB/zz/mOgV6A9VIz
         Kh1y0zvYqDednaSrmnul03uuW62fd26oxr9zD7/wBJjtihbdEDdU29uFaBbO5aWRBczw
         HdLg==
X-Forwarded-Encrypted: i=1; AJvYcCXZM3uM5xC2xVhX06fdKkmCHecDm8criqxBclg/waTNI/DhODs3norobKxmDF9dv9u4O418AAspZiVchA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXhA15yncrrF+RbbLdMNVJDImbvfswteuKD429YtVU2zJZAxy
	iZ+cIu0YQhAd+/gW8ARBaGEnidT08XNh/QSWzw1BBitH1danaXembbPVCZ9+ANvt
X-Gm-Gg: AY/fxX4oKUJrQfhU2Bc4UgjapN38R9uFAv5UZsJgg4XID7mPkfvUL5Cwv4u5AHkTcDn
	cabbe1CVUcqmMNeolJfWW+9d3v2+tRWnLK6t06q6mgq+27USacf4XHiGNyh4O3GZqzC47uELJO9
	EJv8HCUQL050gYdkWEmJ/lwKh40zgMRsLnGc/DnezbBBYrBJL5ZPcI57dzuDHwl+lyvrg0e5RuU
	mZsf/wW28fvQr4/NBtB8+hQ2w0bdNsHY28bYrgcfqWSf2u9XnNbR9KCDFKV4N0z8w2fk3uFp4de
	wUaCB0Ih/7VKjlNuub1Es7vlzmQVwkYX58Eda41MxN8Siec2jfN/dneonE20jmQkVPep4HSNVAC
	MLoNv84LgdOIEOLhQpkFyjTm0GNKw8fcnUYWSozKnVMPWRoc+iVyQgdh8t7nDPLPR1ETwzYgseG
	6tkm1xg7DmPGZdSn7WYkHcjsNW6dHCsA1xgsooQgauJYC1/tV+8rGXOG7fT563Za2ANcqALh8zg
	VPWESPktOsocHoxG7Wxk2wUjZHQso+dDeLzejEJ5Aakuy5Q0RRQSj1h5B1apD7c/hBDq0c=
X-Google-Smtp-Source: AGHT+IGWpr2LvShqyKcudovm1hDHVkoNcZqvX+kvr8LCyX97C107Y54gUSFM1A6uZnW2jqIj4YBAmg==
X-Received: by 2002:a17:90b:4986:b0:340:c179:3657 with SMTP id 98e67ed59e1d1-34f68ce934emr2595798a91.33.1767809677680;
        Wed, 07 Jan 2026 10:14:37 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb7442asm5647976a91.15.2026.01.07.10.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:14:37 -0800 (PST)
Date: Thu, 8 Jan 2026 02:14:29 +0800
From: kenkinming2002@gmail.com
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick
 5288 touchpads
Message-ID: <aV6d5mt2veL-vEvf@anonymous>
References: <20251225190822.150872-1-kenkinming2002@gmail.com>
 <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>

On Wed, Jan 07, 2026 at 06:45:45PM +0100, Benjamin Tissoires wrote:
> I'm really not found of this patch.
Me neither and would be happy with a cleaner solution.

> I'm really not found of this patch. AFAICT, from the archlinux bug, the
> device is presenting itself to HID, and we "just" have a truncated
> report descriptor. I'm not sure if you can trigger that bug at the HID
> descriptor level, without scripting it (so in real case scenarios).
At least I can trigger it, because I have an full disk encryption setup
and my theory is that I might unintentionally touch the trackpad while
typing the password. That would explain how I come across the bug.

> The simplest "solution" following what you are doing is making a HID-BPF
> fixup which checks whether the device properly sent the report
> descriptor and if not puts the one here. The HID-BPF has the advantage
> of being compatible with hid-multitouch so you won't get into troubles
> with a separate module.
This might be a solution but would that not only fix it just for me? I
would have to look into how to do HID-BPF fixup.

> The proper solution should be to detect those situations. But you
> mentioned above that the detection of the interrupts wasn't working.
> Could you tell us more?
This is the diff that is lying in my filesystem. I do not see a nice way
to do it without any race. The call to msleep(1) is just a best effort
to make sure any interrupt that have fired would be seen but there is no
guarantee. Now that I think about it, there might be some memory
visiblity issue with multicore but I am not sure.

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index f9b9dd0d9bb8..161eb8301763 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -66,6 +66,7 @@
 /* flags */
 #define I2C_HID_STARTED		0
 #define I2C_HID_RESET_PENDING	1
+#define I2C_HID_IRQ_HANDLED     2

 #define I2C_HID_PWR_ON		0x00
 #define I2C_HID_PWR_SLEEP	0x01
@@ -219,7 +220,25 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 		n++;
 	}

+	// On some devices, what we received will may become corrupted if we
+	// are also supposed to receive input reports asynchronously at the
+	// same time, persumably because the hardware buffer in the device is
+	// shared.
+	clear_bit(I2C_HID_IRQ_HANDLED, &ihid->flags);
 	ret = i2c_transfer(client->adapter, msgs, n);
+	if(recv_len != 0)
+		while(ret == n)
+		{
+			msleep(1);
+			if(!test_and_clear_bit(I2C_HID_IRQ_HANDLED, &ihid->flags))
+				break;
+
+			i2c_hid_dbg(ihid, "%s: interrupted transfer: res=%*ph\n",
+					__func__, recv_len, recv_buf);
+
+			clear_bit(I2C_HID_IRQ_HANDLED, &ihid->flags);
+			ret = i2c_transfer(client->adapter, msgs, n);
+		}

 	if (ret != n)
 		return ret < 0 ? ret : -EIO;
@@ -585,6 +604,7 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
 {
 	struct i2c_hid *ihid = dev_id;

+	set_bit(I2C_HID_IRQ_HANDLED, &ihid->flags);
 	i2c_hid_get_input(ihid);

 	return IRQ_HANDLED;

Simply disable and enabling interrupt would not work since we would be
just masking the interrupt on the cpu side. In fact, that is another fix
that I have attempted:

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 63f46a2e5..28ba480e4 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -219,7 +219,9 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 		n++;
 	}

+	disable_irq(client->irq);
 	ret = i2c_transfer(client->adapter, msgs, n);
+	enable_irq(client->irq);

 	if (ret != n)
 		return ret < 0 ? ret : -EIO;

> I'd very much not have a report descriptor written in stone in the
> kernel when the device returns a correct one. Especially not at the
> i2c-hid level (I would be happier with a HID module, but this might
> break mutltiouch functionality).
Same, which is why I am asking for suggestion to alternative fixes.

Yours sincerly,
Ken Kwok

