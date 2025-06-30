Return-Path: <linux-input+bounces-13268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675EAEEAC6
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 01:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82CC63E035E
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBAA28A73C;
	Mon, 30 Jun 2025 23:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beKoX0vR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB02246781;
	Mon, 30 Jun 2025 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324812; cv=none; b=rJnq3NvmsECwk8pWi0DOfyrdXinDPL+D/a6nbMI+vSqomsyBM67eNB58zdPRNRHfpNmU+azdrkbPeoqV7LscBuTOhEdzhR1u2m1xvfV+arzfotKlczOHyYBRPB7Lb8cRT5BPyYAdh/q2XiHmtyjNKMd4W9ZqUFuCMoFT806JPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324812; c=relaxed/simple;
	bh=Qkpfu+z5NbqpKsxzprvwjhw0xWEuu6m8rsfi/1nrSGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHQDH1zY6F9IFe45Q6DKLQR/RScfUEPdhduukLGAhrpC6shctrjSJiYmd894JT/0nKlP4tG1Y1axW6L5fYm6A7DorOyoJM0hTx6k145Fqnnc7XnZ3aAC2WbApeTHp90Nmhuyrc/UwmLCokNEVHecNizMzhyMxO6krfc04eD9sS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beKoX0vR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23508d30142so33590335ad.0;
        Mon, 30 Jun 2025 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324810; x=1751929610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7HEWR7W+LW12/jXV4a/HmVZdHf49bbez23dSm4ZpUA=;
        b=beKoX0vRwuNitTWp5PGcAqHTID5fRuJGINU7jVLvpCYnI4Z+w49itW0DKRV+FvUF9k
         T0jiV4B6d9j1yufMuzTccx8blj19iJ4RmgFZRIDUwW7T//mZYWi5TFyG4BCv4URn3XK6
         jm4lO8sQRGrnZk+cE5XkbFfD4exMlGqDTJOpLFh+jU+Q4vBH1hBdhht8xJwlIB6wACtj
         nf48H9pgrX8ch4D7aIgjo6ZFwOb25Nd3+1dE6t23Y5VSMursFOeRzrBfARQA4HUUriWY
         ZIH4MjlOW0pm6sVHgW+7SHBMKt5b8h2LxG9w7GJqO7ndIZmCt/4Wh0P0n0rBLJhJvhYm
         2iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324810; x=1751929610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7HEWR7W+LW12/jXV4a/HmVZdHf49bbez23dSm4ZpUA=;
        b=TolmeDP2Bm3rlSmgC3MOj3PusNe24C24CCQAyuqinAKsJgGUnE377l+uiYnJyTfeSu
         eXYNtjNY2OR9gZUTwTnGexqRmLkSCHfGROEPy5EuwmzroJpRJqHoea3WC/YurHSdDI4J
         hmV3jn7DrctA/6O6BzOdkbwDGtvmCwMsRrAEXHnOWyNE1tMTTQHGHXysdv8MP4zeF8jk
         F/gd1QpGFt/li/Xhn6hoRf9OrVY7kKZlYyaTXf5j7/vTOezXOqfxVKKLyT27zJHwN1Wx
         81vR9YLNWgSZKIoMl8to9Jht39Gd3glPmDuYQmvBAu7bE0z93DgOAOb0mB/j9tbpaf75
         YzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVSD0C+zLP7/bPvjzy4MLvE+nHk9pUVf8BqvV3Va8QLzJ92ShIRsw6S65dMT92b6yx/qUjMWiQz7HBcCQ==@vger.kernel.org, AJvYcCX35rUUH9OvLfdorwz3gO2mOEWGA8ONoU8fc61dO5tINyiwpvaMM2ncOz4r39rqAHazTwEwnq3l1oBSGOIH@vger.kernel.org
X-Gm-Message-State: AOJu0YwReBThfhnkbGpcNWQmHR4nlPJFXsY9sNNnB15QHd5zv4woRCB/
	vydaDTgllUz+dwSslrMoZJUzD7s08s9qdsJM/WdXo1y+khnXPL6SyypL
X-Gm-Gg: ASbGncurBULtOZSkCdYPD5BV5YLyEiQRUEsAsdUVFNmB0g38SzXdKxXnm4pzWh1/Ctn
	WEMe7PDnF6JTVNnJbu9A2dl6jQZr67MX33aSqcpVSUOXsX/v/i2zLixaH+c+fG3P8mUCHpj+VWu
	zXz06jA7FNDS5OSjt3bCzI4sf6tdQhplTBKOYnbapY1ocqbrfMinKf9bG6klNAIk9Ayqgk/oXeo
	rgEghgYXDm7EVfuO5JKoUEt571DJcpWmwNQ12c/Tb17RD9wEfOj6YekxvXYZv1LVOC2Owiy2Mqa
	nIvQFqUgT8He6mQnrmW5pxO6iTkpCGbzEu84BXAKElKzgfNGChE+dI7T6NFS41rZv/39oj86
X-Google-Smtp-Source: AGHT+IEE47BXgA2j3N8UCj5gWmCgfmS1t0dx9jkTxBOSMo7yULL5sWujT/QCBMOL5bzUJpKm69dV2g==
X-Received: by 2002:a17:902:e94c:b0:234:f6ba:e689 with SMTP id d9443c01a7336-23ac46341eemr199554055ad.39.1751324810159;
        Mon, 30 Jun 2025 16:06:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39be0fsm89850265ad.95.2025.06.30.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:06:49 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:06:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <zl5eusepyz62tnfidafvzrgslzftipiysy2ugejomqmzgbc22u@etf4uo2nvqag>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
 <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
 <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>

On Mon, Jun 30, 2025 at 03:23:36PM -0700, Easwar Hariharan wrote:
> On 6/30/2025 2:46 PM, Dmitry Torokhov wrote:
> > On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
> >>
> >> Also, it may make sense to CC: stable@vger.kernel.org for backports
> > 
> > What for? Stable does not need a patch papering over an oops, it needs a
> > patch making the keypad working on the affected device.
> > 
> > Thanks.
> > 
> 
> I don't have a stake either way, it was simply a suggestion, since it qualifies
> IMHO, per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html,
> the patch "...fixes a problem like an oops..."
> 
> The proper fix might well be, as Nicolas suggested, adding the required compatibles.

It looks like it is not only about adding compatibles but actually
adding proper support for the missed variants...

Thanks.

-- 
Dmitry

