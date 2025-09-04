Return-Path: <linux-input+bounces-14472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73705B43166
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 06:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E4E3581EA0
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 04:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460A11DE4EF;
	Thu,  4 Sep 2025 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbQBWzYp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48EA163;
	Thu,  4 Sep 2025 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756961559; cv=none; b=jhEiafQye0PFVOn2ZXg5oxaYu1s7I9DZyB9sW+q4bOiW/s5bMeSNNav7Q9IOQTiZAnifFWpxxpNAoZIXm3VuXa422QFFLCAB5VtuoWsYHvL29qXoTA7oS4E6QeQp/t6UFpmF/M6gdk9miwIvTB3GTO7ljN0oGdMLblo0qqJFl8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756961559; c=relaxed/simple;
	bh=UpIXrFzX94ZD/a5vUSXMneIpQ7nvqDgV36IaS5y1KKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSdoM5FT7qWlSsrFqc2zxxzc9WR/z7s6GH0NuvjwvMbbLgmdbZyDhGJvA9FlP0Tlwph0764eD6ONbZggi++Gko89iXctkyNuTa+37CEStv7YJdCHooCAhAxHudrRc7PBIYNSqdVp1J6TsW3/He3htbfH997oM7RUt5nimEk+R/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbQBWzYp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso394113a91.1;
        Wed, 03 Sep 2025 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756961557; x=1757566357; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpIXrFzX94ZD/a5vUSXMneIpQ7nvqDgV36IaS5y1KKI=;
        b=AbQBWzYpVXJrEzksOoEu+yEE1miA7EAwXG63CAbHuiQjoNkIBrXQc6z5u4KoggC1m2
         GB0K2WTWW8MnoTQr+cgJTnzNucJVxy002h0Jf9B/5fw0ANYLwo9AK+eVY+13WdXc+BXl
         MGvjtPRbw7mvTTOhFKUk3IezB3JLfnQ/3r53UkreW7M6TU2CUSC3w3rR1DiEl1HE32Sw
         TNgFJJRI45MChht7ybJAFuRSYwl627bKRFNy4UcEA9DFb1P92oIAgODwycl2n8Z8z1xi
         1ICGKZnFRQl4WwNfkNTOczUszGmRLZ6kQ2V+2uXIg9xT44yrN4Oi0zJYgQWuxTKUBOuI
         I2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756961557; x=1757566357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpIXrFzX94ZD/a5vUSXMneIpQ7nvqDgV36IaS5y1KKI=;
        b=m9SAfiLU3wUUEvvkdZuid9Q5H7xTJdRR8hQ+QvGwqskdiS+rC4ZOkEH4nq4zuEEMOG
         yPvwKRvSkRGZSnx44DztxtWTqrTeW7dAvydhmfMdpDHLQ8/6APOKnCClzWYehFmyCBmj
         aj6u/hhgjwDdtq+nVCH8jmofKsYvCFqkPt/YllZZpGbt1MUC+T+/y46/emCuqhmW1/2o
         fA9WYQ0wtrL0pAiB41YPlc/F0FDbdm7JU0S9xBTpIuuXD/R2eqczc0SUSxRbYv2qIVOb
         vGqSuubfhYzVW5M69zi/QHY3tlZiw9GFftdiRw5itJD//ni3+AUvwze+qU1GdRTZBetB
         OX9w==
X-Forwarded-Encrypted: i=1; AJvYcCWcOjfBO8xrz8zJ/2T890glwE3Owsfvqfs6HDKdwZVirnsDoXDri6H4Kfvwrh8PsoqtQ3ATQT62HphlKJ0S@vger.kernel.org, AJvYcCXdY/9IklTTGc9VqO7rAQVIYnWl+zPy/ks0sBIfxMnd1ZYArdGm7+ItwCN4Okm9NcdiccUhyTuhfLxI0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmxB6LSPrmW22fGJm3CCqbUOpOjbJl83EahocLopaQxJMRt4v
	342D63mKsTqEOCW21TmVmXZce5hzwo1usd0ZhEUgrSrzvQNmrCgeX7lrhwqxLtpShMQzdRBhwJ+
	aqGAHTmSY5UJkfYmWUeTZAPfSpQ5zXP0=
X-Gm-Gg: ASbGncvHNllBQ2eNSxztUXjAxIxpuTFZYiXKpWmDnZwlqdsn0Vs9M9nD5B83MhRHK5+
	J/B2eioZLF1W6cwds2CRzfR5fos4nYpHgzBcxuXpnH/1Vs83LEBwLH3M0lYI13ZPgTWZ+XPElNO
	oYJHSo44y8a283ZaQuMbywxk0Ld2yAfbLpRFSVqCy3AGl0PKSWSCR2V3PGSYQMZq8GEP334X/jL
	4ahddg5+BTxK/pYahATiAYPq09n5jy0+iybedx1r+X8gMBblLY=
X-Google-Smtp-Source: AGHT+IEm8ecLi+g+ZBGqWqv5ZjZDmvBlfxk36uGeXmTU0HSEeJhqP30EH4pNIVUo/cGBGQgMbiObbXUgu8NN4wnc4+8=
X-Received: by 2002:a17:90b:3ece:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-32b975012e6mr1130068a91.27.1756961556899; Wed, 03 Sep 2025
 21:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717112643.1410093-1-aha310510@gmail.com> <4r8n3287-o91r-4903-0o01-5q93834sp47n@xreary.bet>
In-Reply-To: <4r8n3287-o91r-4903-0o01-5q93834sp47n@xreary.bet>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 4 Sep 2025 13:52:26 +0900
X-Gm-Features: Ac12FXxjvRYO0qzoeOnY-sBVhp9U87ne-RBmVNCJx2Tl62rCBZw-GvONQSgq1rk
Message-ID: <CAO9qdTHgEkwUGk69MdT0hC5TQ-G7MNsF_GdbGSCdMfKYgCrZ1A@mail.gmail.com>
Subject: Re: [PATCH] HID: steelseries: refactor probe() and remove()
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, hadess@hadess.net, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Jiri,

Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 17 Jul 2025, Jeongjun Park wrote:
>
> > steelseries_srws1_probe() still does not use devm_kzalloc() and
> > devm_led_classdev_register(), so there is a lot of code to safely manage
> > heap, which reduces readability and may cause memory leaks due to minor
> > patch mistakes in the future.
> >
> > Therefore, it should be changed to use devm_kzalloc() and
> > devm_led_classdev_register() to easily and safely manage heap.
> >
> > Also, the current steelseries driver mainly checks sd->quriks to determine
> > which product a specific HID device is, which is not the correct way.
> >
> > remove(), unlike probe(), does not receive struct hid_device_id as an
> > argument, so it must check hdev unconditionally to know which product
> > it is.
> >
> > However, since struct steelseries_device and struct steelseries_srws1_data
> > have different structures, if SRWS1 is removed in remove(), converts
> > hdev->dev, which is initialized to struct steelseries_srws1_data,
> > to struct steelseries_device and uses it. This causes various
> > memory-related bugs as completely unexpected values exist in member
> > variables of the structure.
> >
> > Therefore, in order to modify probe() and remove() to work properly,
> > Arctis 1, 9 should be added to HID_USB_DEVICE and some functions should be
> > modified to check hdev->product when determining HID device product.
> >
> > Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
>
> Applied to hid.git#for-6.18/steelseries, thanks.
>

I think this patch should be applied to 6.17 rc, not 6.18.

This is because while this patch primarily addresses a potential memory
leak, it also addresses a memory corruption vuln that occurs when using
the SRWS1 device.

Therefore, it should be patched quickly in the rc release, and the stable
release, where this bug exists, should also receive this patch.

> --
> Jiri Kosina
> SUSE Labs
>

Regards,
Jeongjun Park

