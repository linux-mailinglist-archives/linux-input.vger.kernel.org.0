Return-Path: <linux-input+bounces-571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56003807C57
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 00:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003F81F21BE0
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 23:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AAE2EAF9;
	Wed,  6 Dec 2023 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YvEXVo4y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C31181
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 15:32:19 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66cso4840025e9.2
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 15:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701905537; x=1702510337; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhmB80cZyzkXTbAuvFBPao9VdOjBS6zAfo3w2wC8nJI=;
        b=YvEXVo4yZaXjxC8OPvVppXNuxfsgT4sKgFW9ufBhy307N1A9Q2OnqCdtmD5YdgM8wP
         WGJIDykL9vidLLEkcESIwfDGNGG1+EG9F6QlvWN1KWPPoavUZBCHn3+J9+AxmKSNIPzs
         6uG5DpJS1G+jkWk9c+uygu/5/vfKBGtQMpgUmsCHKzpze1EjUXLPru3sGBAlBQC05UFO
         IYW/+YCO0OV1iM5ZA2k+CODcYcxt9pppv2NS45uC7OG1xDtI3ymmgezvAkvbYl48m893
         2P060lUNBcntSm0m09JMeD5T9rI/uufSJR/bWi2WHBbfs2UFztxeZYhXmSbj0ldMHnSz
         0yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701905537; x=1702510337;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhmB80cZyzkXTbAuvFBPao9VdOjBS6zAfo3w2wC8nJI=;
        b=ZMDxuYkPqYEYBgIs9kcA4p7EoTH9o/biEVdWFRsx325176Hf0ysq2DrJuUwpkY4nQu
         f+qbZlhU0d1PIu/r4A/ylX/LKrslPNgezg3o6zkmz+4aaiT7DfJl8rkMY+rSHuHj0Pf6
         HpPahyPxQbduIozbObSkCtuI4a7ArVyrEB+9zEDNNtcaIPvJRFu7O5i7KQUw01EIOd1i
         StlJnXoWJ5CWUquP686Vlxc4mf1M5m5f485Eh/xCVHCpVQjSQbjsIV/96KkBAqA085FH
         X9eitLmf61Shofm9bBP6jHf+IFTvBZj0cT2JrX1WJu49Qn2TFGXsJphdAct3TE2sWDBT
         G+zQ==
X-Gm-Message-State: AOJu0YyLzGwsHQ/W+3xFqCaHSgTcoD/nqrHtYvczSzrWTp91/sX9Fg23
	LU+3I+hpRORf2pzMAisSpls9eQ==
X-Google-Smtp-Source: AGHT+IGIgnV3BoRr41B2+O2ZrJOMKZZ6pkZGjZ2WZi3Wn8K2asMEsGUUIVj0kMRVkT1DbM0qb+as5w==
X-Received: by 2002:a05:600c:1ca6:b0:40b:5e21:dd2a with SMTP id k38-20020a05600c1ca600b0040b5e21dd2amr1006878wms.88.1701905537666;
        Wed, 06 Dec 2023 15:32:17 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040839fcb217sm1062847wmf.8.2023.12.06.15.32.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 15:32:17 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 7 Dec 2023 00:32:17 +0100 (CET)
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Shuah Khan <shuah@kernel.org>, Peter Hutterer <peter.hutterer@who-t.net>, 
    linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] selftests/hid: tablets fixes
In-Reply-To: <20231206-wip-selftests-v2-0-c0350c2f5986@kernel.org>
Message-ID: <nycvar.YFH.7.76.2312070031210.29220@cbobk.fhfr.pm>
References: <20231206-wip-selftests-v2-0-c0350c2f5986@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Dec 2023, Benjamin Tissoires wrote:

> Hi,
> 
> the main trigger of this series was the XP-Pen issue[0].
> Basically, the tablets tests were good-ish but couldn't
> handle that tablet both in terms of emulation or in terms
> of detection of issues.
> 
> So rework the tablets test a bit to be able to include the
> XP-Pen patch later, once I have a kernel fix for it (right
> now I only have a HID-BPF fix, meaning that the test will
> fail if I include them).
> 
> Also, vmtest.sh needed a little bit of care, because
> boot2container moved, and I made it easier to reuse in a CI
> environment.
> 
> Cheers,
> Benjamin
> 
> Note: I got the confirmation off-list from Peter that his
> rev-by applied to the whole series.
> 
> [0] https://lore.kernel.org/all/nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm/
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

FWIW

	Acked-by: Jiri Kosina <jkosina@suse.com>

As far as I am concerned, feel free to push it to hid.git right away. And 
thanks a lot for all the work.

-- 
Jiri Kosina
SUSE Labs


