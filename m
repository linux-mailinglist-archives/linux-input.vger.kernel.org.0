Return-Path: <linux-input+bounces-3250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6AA8B12EA
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 20:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831111F22735
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 18:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B7219BDC;
	Wed, 24 Apr 2024 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D5earJn4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7418C31
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984837; cv=none; b=Bc81BPvc6njaeSOhWNKOSqS24138eMnEykJ/nTwcD7tFMQ+OOA95h3r9X5c9EthDdLyujhYqaj7Mo7BqRaDivnTu+c8SGdLoKcSboEhvr0w6bgYUENqjoQTnkT2Evt62z4lkEwgn0tUeFoAAA3WtK6wL0/7CrpkATh3oLclHK0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984837; c=relaxed/simple;
	bh=L6t8/1Otid03POwko1fB2t8xd2r0RXQVTBsaux3bVhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5h8xw1oXqSdyjSooMeVLht02OkkrW2Bz0qokHOteLx3gCqcVi1f013awCr7/OaAqpMmsWqStMjzkSf2cjXH2WKnmvX0S2qT2yySrYrHBmHX5nAO3yNMY9wQPOxCkzxQXITPq4A3FsL4IFTi0/ijAmwYV3FH0bu0nhXIdeD6Yik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D5earJn4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5176f217b7bso287214e87.0
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713984833; x=1714589633; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AMR/e3F+Pk4bn/6/mhO/XEfDpxEpt87AN3boxF73T/M=;
        b=D5earJn4qMZSKQre1nzcqFmrosPLq1SnRAxkLa5HIADw/3gXoGHiE9HDIaRIIMpHLY
         LJnNwS/YBfMIce8mduRbjTOl6HuphMSBR8SZXUtIscWaGLLYfpIiXv+RCyEnmnHdexuP
         ap2ARIhS7Vo23MwneP+GL9IBxo3Uycx2pbZUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713984833; x=1714589633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMR/e3F+Pk4bn/6/mhO/XEfDpxEpt87AN3boxF73T/M=;
        b=OPHOebehhORre3yakgB7/zachU5FshlzVkjwuCMOv+FT2HWv7kaHwxhVeGXNd9dQff
         P2eCd5j02LM9HqarVxDS9wT28XLbK8IGS4pxnRUcJjktLt+2Y8PsBID0zhICSIfUscjZ
         3kxKBtxSbQoNZXS2lA3IoAMYDAM7jfF1w5RSVcl2iYPgi/jY+ujPzdSVRPISkJrYN1jk
         /pQO4cUUK2jD7IDAYD1e+Xia/o0JhmjrbwnsmVbgyUVda3ORuEGWIXD8rqyCDC0djElp
         1682//8X5XhpJaVe8pRmfWoyMEwjCVOKBeInbWofro2elroLQqsOYHbspo9BM2Sbnmhx
         Arxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjWkKoWJ8KJ5a7uVoPhpE1CUEDgnx2W9yUrv5trH58Bhuijkc/Oweq6AHUJkOTdumwkDphf+DK0opTTGWBMude55Uazlbg3+naCDk=
X-Gm-Message-State: AOJu0YwNKKNfG0BKOuNnZMRDF9KPIXdXxMctvdqKTqZrJeFttBvSw/XM
	/9CQSV+ddDh9z8/HmfcPHUfOmtdt4JQOWdD4ujhrwbJ3HzN+FpUc0vmci3nojv65IG+/vkCTNmJ
	zZEP1Yg==
X-Google-Smtp-Source: AGHT+IHsnb76vne3n2STJG4mMCfUrM/6CzY0I4YhMiRAyfqgndcmAvNfPxDqT2NufCmFV1wx/6zXxQ==
X-Received: by 2002:a19:4315:0:b0:51b:e707:74dd with SMTP id q21-20020a194315000000b0051be70774ddmr2763873lfa.33.1713984833370;
        Wed, 24 Apr 2024 11:53:53 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x30-20020ac259de000000b00518bdeb20e9sm2495603lfn.133.2024.04.24.11.53.52
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 11:53:52 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5176f217b7bso287164e87.0
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 11:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/uynyKDLCfUUyXe4fhcO60etm+wKb6CoCGJdkt6wTxkCT70DE2pwByKInda0tTo3X1aoOVJRih5JfHla3ZVudU4k2auWpJ+SEVM4=
X-Received: by 2002:ac2:5938:0:b0:51b:c43e:ea84 with SMTP id
 v24-20020ac25938000000b0051bc43eea84mr2412368lfi.55.1713984832182; Wed, 24
 Apr 2024 11:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240331182440.14477-1-kl@kl.wtf> <14d1b38e-0f11-4852-9c52-92b4bedb0a77@leemhuis.info>
 <CAO-hwJJtK2XRHK=HGaNUFb3mQhY5XbNGeCQwuAB0nmG2bjHX-Q@mail.gmail.com> <a810561a-14f3-412e-9903-acaba7a36160@leemhuis.info>
In-Reply-To: <a810561a-14f3-412e-9903-acaba7a36160@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Apr 2024 11:53:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjy_ph9URuFt-pq+2AJ__p7gFDx=yzVSCsx16xAYvNw9g@mail.gmail.com>
Message-ID: <CAHk-=wjy_ph9URuFt-pq+2AJ__p7gFDx=yzVSCsx16xAYvNw9g@mail.gmail.com>
Subject: Re: regression fixes sitting in subsystem git trees for a week or
 longer (was: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before
 reading report descriptor)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jiri Kosina <jikos@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 09:56, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> out of interest: what's your stance on regression fixes sitting in
> subsystem git trees for a week or longer before being mainlined?

Annoying, but probably depends on circumstances. The fact that it took
a while to even be noticed presumably means it's not common or holding
anything up.

That said, th4e last HID pull I have is from March 14. If the issue is
just that there's nothing else happening, I think people should just
point me to the patch and say "can you apply this single fix?"

                         Linus

