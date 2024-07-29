Return-Path: <linux-input+bounces-5192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 076FA93FC8F
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 19:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395AA1C2203F
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 17:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0CD15F301;
	Mon, 29 Jul 2024 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Z3T0vSWg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656797603A
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722275060; cv=none; b=CsAzMzylk5e0QiOU+yZSJxpuEXcTvvK1hnZxXIIoHR/Y1pyWBgIfWXffDQMGJ4NyC8XfLBBGsVrzmSlSXSRoNYAAEISbPnHGYvR1Du1EkQi1Vpvu26qMbBmlamVFOOXL1wUvOltFh1iwvGgktNaUd8KE6NzjeLWyu0Ac+ROgx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722275060; c=relaxed/simple;
	bh=ypwwnBFKYTroVX5TGGRuBoOnIzOAQBfkm6PQThWbFqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1Dzz2ikL8eyddSB0+SaqLAXbuvmUdPOkv6MBmqHNHc6Rhy2ugbTUpNelVDWMwbwWWgt+FQpcJF8LwtySLDAyW2LwlEq5n+TECKIsF4CarEzDuh3umYhj0qDew7RZ5BTbVh3NEGcgAcN+5h5SAM2Jvre9mJpZFBV94eW/hoiqJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Z3T0vSWg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so58803101fa.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722275056; x=1722879856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5VpoOJlnZJ8oPH19GJcs9MFvH4abgGshQxSK36fW6FA=;
        b=Z3T0vSWg8lKwZOKaDCT8uIG24I1nQfF5181ocF5ZxWYIrL/6a5rEFAQ3XpPwcUbmgS
         Dc7deGV2v2bQWKyMGA15TA+Um1dv+PgNr/H01/hV0Loios/adTsQrsfW2C7meLdP9ht1
         QAbDIscjpI/YiEl17P7Gp1o0hU9BwGoGFRaV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722275056; x=1722879856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VpoOJlnZJ8oPH19GJcs9MFvH4abgGshQxSK36fW6FA=;
        b=DhrY87jG+6KAq2zr0sG4odHen8u/8rGFk5wgSzyURwQiiWZ41E1hAqWT/C3qYTgvmf
         DlvT+tWfg4TqHjevQrMUxBgiuSPqU9yfCD6CW9hK1CoIJrmKHJGlZMP0bXu3qvnYqQud
         pNOEfsc6UTmp92XjR2EMlwYTERRRl9p50pJCNeBNJtDKGJjlgvO7Hf4OKLcVgaaoHyUj
         uqDWOGgA+SNHnSZ5xpHDOsRGgIpRI1O+ufXZC2qZCncTKgOmW1pYp3C5m1mOvodNXS/C
         HDVru/+xCE8TRWEXq7Ixl34GtMRYqJV5WcvsHmdrDNoRt4K/yEeAYOA/C4LDg5WmhUAe
         KmvA==
X-Forwarded-Encrypted: i=1; AJvYcCUjELuj6rF3DO0+VHscKcUVMEMkmxnFTDCygXhOBQrbg6bl4NfLfdLM4dkFuWIzyafS6BXMJHwRkbxDw/QFwn07tVSLrnNDyNmlvL4=
X-Gm-Message-State: AOJu0YwiVdbV/zvHyn7MJbjEcIH1Mg5onZ+ilki442pYNX4i6LF0fp4u
	eaAdtzBv74pFvdVnFcpkTQGTL3rOb06pIvsaGpicMcougXiQgoKin2FOIwydB9Br9eW9jOHN5ML
	ECkjW9g==
X-Google-Smtp-Source: AGHT+IEHu9jzLes0e6kUzS5RAmkrf7z+Z8JaMF97hicXy2x0bA1x4w0s7GN7nC58e0gHTTZrBHPptw==
X-Received: by 2002:a2e:999a:0:b0:2f0:1f15:5a16 with SMTP id 38308e7fff4ca-2f12ee1177bmr70905211fa.13.1722275056308;
        Mon, 29 Jul 2024 10:44:16 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d04dc3asm13824511fa.75.2024.07.29.10.44.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 10:44:15 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so56581941fa.1
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 10:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWNgXk+71aIoiX1PeRY7qG1dvznl6x5uweR1RGKbUw//m7WFeEPBSfaulXjdhycWEdHH1C8ZvbvBYF2o/EuWkURYUGEiOtjyEN4J8=
X-Received: by 2002:a2e:b019:0:b0:2ef:2012:eecf with SMTP id
 38308e7fff4ca-2f12ee28995mr64166721fa.26.1722275055045; Mon, 29 Jul 2024
 10:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh> <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh> <Zqe76gATYUcDVLaG@google.com>
In-Reply-To: <Zqe76gATYUcDVLaG@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 10:43:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
Message-ID: <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Henrik Rydberg <rydberg@bitmath.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 08:57, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> iThe other types of warnings, such as the warning in the memory
> allocation case, are warnings of convenience.

No.

They are WARNINGS OF BUGS.

They are basically warning that the code seems to allow arbitrary
allocation sizes.

So apparently you've been sitting on this problem for two years
because you didn't understand that you had a bug, and thought the
warning was some "convenience thing".

I'll just apply it directly. Don't do this again.

             Linus

