Return-Path: <linux-input+bounces-13885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CFB20553
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 12:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6074618A1CF2
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 10:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062522367C5;
	Mon, 11 Aug 2025 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnYbiIpL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335B2309B5;
	Mon, 11 Aug 2025 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908213; cv=none; b=Ecwr4gnBfpNq9OVyF7MgFrit94hL5IryW4nthkezMX7+goWSdvZtEcMbmErnNWpgtlSw6Bm6zKyTdIFgi5cOSB3oArAqk2DBSRqepbzl1CILSyU9R2SDouqLi0z+vaivDDzgZtHWtpydzeNXwbfmHzJ4Y8HZfBcpxB3upquU2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908213; c=relaxed/simple;
	bh=nOPnsDvXVK+zyc+LpfTNmzChp1SgqZuOCAECeC7rrAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlYveiP7NLBtMI4l9gpBJTnoSTRuCZjxZsfADsxaxoBhBzXcveWTcAvJRImqOpFK0t5mOwgfY0HiChQi7FtFA3C/A2sZJOjIKsefmTFAezi3KUNEaf2YnJ2SdCnZtaMbZd3XIZdxN/9h4nuQn3akm1MCoKYUZRXBFJqFWRi1a+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnYbiIpL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so21003005e9.2;
        Mon, 11 Aug 2025 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754908209; x=1755513009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IdgpEQq7xpRcgPsDWPCngExwvMSjTB/xaISALicIjGU=;
        b=PnYbiIpL+vC+W/8aueNwx7QwINU3NJlwZ20kmewptXncHy3gEyBSQY7EnSzVq4lYYC
         krL4xCX2xsE9z6NbTUrhY4GIuGsH5jvDHU/xV0XSZeviiryaPrCaL93XBL5/7pm1XYay
         s2LAeKmy1XYvg6uhKnyGG5+ilhAeWOvUii+Qp5xpVKLbToteftrrnd/j9r1RHMfVY0y5
         ZrK01Lnev/jcnG5u4HBj2THyonbOrMTFukJptPOdQ4z+6gz4XIWVP+dqAvpX8xj2Eek3
         5Mr2X775QHimb8YdVAXE/GzFGG3ToPzlndoI0vE6wEhE8OJA7FsmHFtr9PSiSPgBQ4NT
         2ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908209; x=1755513009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdgpEQq7xpRcgPsDWPCngExwvMSjTB/xaISALicIjGU=;
        b=PPOXsDZeExXGcyy6fx0VMfsHlPLLsA4sheeAYnmLfEhE+atE+FsMl4fw1zJqYOtxAR
         BCJjyiEjoykjISaBxBnx05E1BefsjpuJ39ywMyfI1gxXa1z4MVi3ZtNCuOQPB4dyiXtR
         g2rrdMOHsj/PHJAcFMd9PlnnTp3dyz+dl08YtudsXwIgtNArw6IEu+XDuc5vhSnsHHVU
         TN3IE+qmEvBBINwopGIU/SVlmYLpsReUvInJTDKJm3q3BGUWDferNixCeGX7+pwNQANu
         s++gziFXTk4tCy/BnlycMk1Q9TiCBLQVdg/reTuKfgu9/zrZyDWI8qS9rQsChZvRiaoB
         G3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUea1UiE/arYweVTQz/co90SULH5SKKqYAdpIJXHvYLtFCEeC5bcMvgu3xMtexrhN5PRUsA20QYkR9GLnZc@vger.kernel.org, AJvYcCW059M/HxOHtlYvWcICz9y/8APeQzWN2PDrMPkHf97vR2XwCVGEaTlMufNzQTNL5fGrJfCwj795NXBOAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HRKOPEGOqbODKQxTFX76raPbslOJFfwAX2AN7tW+xbUnNYaZ
	KCvLtSO30RXZvPUOK0fQb7dGq/3uD8/g9gl7Zgkor6r2ZuDrYkGO71RG9ZX3QXOY
X-Gm-Gg: ASbGncuvgr1PC2OmRvqPD0HY/ASF9vJkk2MmSFbsuAP7qT/OhWWZrwxFmFxwHm3nazw
	szr+md+NNTdqVCAbcmt7fk99X8urWysx96LnKQX5BtmI2ryMcdg3ovCL21YHQklFbWitFdw5xFo
	5Bwcz4rEBLH9+GcwngblVuJLJLr49RNG4/ibXxtQ4TACsl9zWQixGPzU+4h+fEk50XDX/RYgsJe
	t1OCfypbOfFGQMQhxXF0O5Prb3r6uclCQgQSdKaWEgXYzB639QfS+DEucr2O0n/LemFGMtcaJBD
	z8fZ8ZujWkL6KZAjk7UyNHpPq3ni8zm58vC7l/STPaBxeLYqbv3E/nvRBYLV2xQM1dzOG7xzMu/
	XeekgSV1SpwHzYoj60gc=
X-Google-Smtp-Source: AGHT+IELXFujkonvGXDZVcr/FPtjORDZi9uzt13VlHrYlAT8/cNZd3hc5+VU06OYD8310FS8mtFm/w==
X-Received: by 2002:a05:600c:3b86:b0:459:d9a2:e920 with SMTP id 5b1f17b1804b1-459f4f2e214mr116814035e9.4.1754908208942;
        Mon, 11 Aug 2025 03:30:08 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm40147763f8f.22.2025.08.11.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:30:08 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:30:06 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFp?= =?utf-8?Q?l=5D=5BPATC?=
 =?utf-8?Q?H?= v2 2/2] HID: input: report battery status changes immediately
Message-ID: <aJnGLkM-t0aYjzie@fedora>
References: <20250806073944.5310-1-jose.exposito89@gmail.com>
 <20250806073944.5310-2-jose.exposito89@gmail.com>
 <726471d1e4774348bd62ecf289a5a307@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <726471d1e4774348bd62ecf289a5a307@xiaomi.com>

Hi 卢国宏,

The mailing list won't accept your emails unless you send them
in plain text format. Forwarding it for awareness:

On Mon, Aug 11, 2025 at 04:23:55AM +0000, 卢国宏 wrote:
> 
> Hello, José!
> When I submitted your two changes to Google's Android GKI (The patch I compiled is: https://android-review.googlesource.com/c/kernel/common/+/3723411), they raised two issues:
> 1. This patch has no functional changes. Why is a cherry-pick needed?
> 2. FROMGIT patches must cite the source repository, branch, and sha. Please see https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/README.md
> 
> From their documentation, I learned that they recommend submitting the changes as follows:
> Requirements for other backports: FROMGIT:, FROMLIST:,
> If the patch has been merged into an upstream maintainer tree, but has not yet been merged into Linux mainline
> tag the patch subject with FROMGIT:
> add info on where the patch came from as (cherry picked from commit <sha1> <repo> <branch>). This must be a stable maintainer branch (not rebased, so don't use linux-next for example).
> if changes were required, use BACKPORT: FROMGIT:
> Example:
> if the commit message in the maintainer tree is
>         important patch from upstream
> 
>         This is the detailed description of the important patch
> 
>         Signed-off-by: Fred Jones <fred.jones@foo.org>
> then Joe Smith would upload the patch for the common kernel as
>         FROMGIT: important patch from upstream
> 
>         This is the detailed description of the important patch
> 
>         Signed-off-by: Fred Jones <fred.jones@foo.org>
> 
>         Bug: 135791357
>         (cherry picked from commit 878a2fd9de10b03d11d2f622250285c7e63deace
>          https://git.kernel.org/pub/scm/linux/kernel/git/foo/bar.git test-branch)
>         Change-Id: I4caaaa566ea080fa148c5e768bb1a0b6f7201c01
>         Signed-off-by: Joe Smith <joe.smith@foo.org>
> However, I didn't find the information Google mentioned in your email: the source repo, branch, and sha.
> Have you submitted these two patches to the kernel tree? Could you please provide a patch with the information Google needs? Thank you very much!

The patches are not merged yet, that's why you can not find the commit
SHA that you need.

A maintainer will send an email to the ML once the patches are reviewed
and accepted, but they are very busy, so it'll take some time.

Jose

> ________________________________
> 发件人: José Expósito <jose.exposito89@gmail.com>
> 发送时间: 2025年8月6日 15:39
> 收件人: jikos@kernel.org
> 抄送: bentiss@kernel.org; 卢国宏; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; José Expósito
> 主题: [External Mail][PATCH v2 2/2] HID: input: report battery status changes immediately
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> When the battery status changes, report the change immediately to user
> space.
> 
> Fixes: a608dc1c0639 ("HID: input: map battery system charging")
> Reported-by: 卢国宏 <luguohong@xiaomi.com>
> Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
> Tested-by: 卢国宏 <luguohong@xiaomi.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/hid/hid-input.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 262787e6eb20..f45f856a127f 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
>         return false;
>  }
> 
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> +                                   int value)
>  {
>         int capacity;
> 
>         if (!dev->battery)
>                 return;
> 
> +       if (hidinput_update_battery_charge_status(dev, usage, value)) {
> +               power_supply_changed(dev->battery);
> +               return;
> +       }
> +
>         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
>                 return;
> 
> @@ -642,13 +648,8 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
>  {
>  }
> 
> -static bool hidinput_update_battery_charge_status(struct hid_device *dev,
> -                                                 unsigned int usage, int value)
> -{
> -       return false;
> -}
> -
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> +                                   int value)
>  {
>  }
>  #endif /* CONFIG_HID_BATTERY_STRENGTH */
> @@ -1515,11 +1516,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>                 return;
> 
>         if (usage->type == EV_PWR) {
> -               bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
> -
> -               if (!handled)
> -                       hidinput_update_battery(hid, value);
> -
> +               hidinput_update_battery(hid, usage->hid, value);
>                 return;
>         }
> 
> --
> 2.50.1
> 
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#

