Return-Path: <linux-input+bounces-4399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70F90C1D9
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 04:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 778F6B20F8F
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 02:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F2BE56A;
	Tue, 18 Jun 2024 02:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAuCdnbF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BB68480
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718677665; cv=none; b=e9JEGRYyVreJ97q4tfDg7Ih+KCEnjbsxhny/9KUGOpGBekgQHPQBVoO5jq2cmYYrSpK7WcWezXndQCWl/fPg6Qdpi9/TBS3M7jsdrSkXsmOLMXGzC7UI+E79BtGfrfpxjOoMBw6UsiXi9PgfmxtUdj/2WTAXrjhjugMjHpMijfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718677665; c=relaxed/simple;
	bh=RY8OQR86wfRcnlETyxKHPFy2yA6e2ZeXgMvHY8IQ1dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqi6BDGgU7eS0vdDVam9WGLB3UZTaqzKm6tAjDtB35F5Hb+0euVvssh0NYTTCE+t8rtUOUDcuDYjrqDA23LLQd+IVZ1jcnGk420yd6JNK6E0BmiGc8N6hf5LAU7vsWvHuoU9knvtDIxmYwaOdXTsfHz/1gZRtb3GyTUjrlBlmAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAuCdnbF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a0849f8e5so49920517b3.2
        for <linux-input@vger.kernel.org>; Mon, 17 Jun 2024 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718677662; x=1719282462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY8OQR86wfRcnlETyxKHPFy2yA6e2ZeXgMvHY8IQ1dg=;
        b=bAuCdnbFjIHnMmEXVrzdRjtXkzVIhq9kgZQuIpFoDqU9UrrGybGUJRiAFShP9ahhtP
         YeBs1iRMJ0BzdiyxUbodp6MPF5DethfP2pco9XowW1veCPlHOFqr5pVXLdFKhO2PbZtV
         8lNJ4KVa91bvCbbXLA6NQL56CYiyfhkQwWytq/A/R+Kb1AwKWTE0dfB29YPh+Slr8vWU
         DZsuA8E5HFIUToCDCqiN4IB4QOWtHtA0mPkfgWOdsxGBpcIozvi5e6duuzVB+7s+P8Dd
         mtLryLZ1jC+Sg3SEUHyVT1aJ0nt8sIlRhlkGP6G57HklM9aDSyCw6OZ8vjHLLEgUmfRw
         t+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718677662; x=1719282462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY8OQR86wfRcnlETyxKHPFy2yA6e2ZeXgMvHY8IQ1dg=;
        b=bMxkl8NxUbAGXHRrOJIfL67A/TBNQFaFVo6I8lsbkd8BKErGGVsJ2+H62/NuZZjujH
         44UJitcce5OgZbu1LCHPbMpj3BdBkmGHpgbqrrPZ2SmMdd1yDqWZobcu9dF1Yfkez+e3
         JB3lfgJN3lz/qdB2M3PIlos47R7Jn8KmZQIglJI/OfHdhW31AF+tr0HrZ/0r9bLc6LU/
         pwF1+LqzLxO7NLr3u+LDSdQ94tkCkDQeimZx8DLzvg5eCJfPcCd63bHu8cF2qRc8APFM
         XoHqyviisHuTE3VNPa7nOCbAIhcCpyg1b9Ew7G3Y/7SuOh3dA3V4tE6Ezjrbd+Cr/2aI
         GlUg==
X-Forwarded-Encrypted: i=1; AJvYcCUIIfPcWlXRmtltyaZaPDuoxMdgsCx2TwsXavlv528Ds5YMMmrp5EwonqTP6U0El1ZQDnnJ+nysquSieX7ZwYfp7SdG5dCIGimQLaU=
X-Gm-Message-State: AOJu0YwN+dD1zQI5OPLzjfARczZsLfSi1xZLQM9gFT05Ay1guvuDFL61
	slaIU0cw2pJhEoBAxB2sDD6gbE6XfRXwyDJu55HDTfND8EH0Yzrwau18fPcEDATQgdpACsv0wWu
	SR4ryE6DyTdbrAWLf5ayGW+helzA=
X-Google-Smtp-Source: AGHT+IGUFrtpQDgKUoc1Xse20ONiC5m1avPczQNyIcdY/qcP9Bq8Eigg54nHpPz3XuihFucv64EQWET7+p4NFVoLo5k=
X-Received: by 2002:a0d:d408:0:b0:61a:e947:5518 with SMTP id
 00721157ae682-63222b58acamr107834597b3.27.1718677662552; Mon, 17 Jun 2024
 19:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715224143.git.zhoubinbin@loongson.cn> <714216496603cd23c18d9d3e1cc52d8ba21e386d.1715224143.git.zhoubinbin@loongson.cn>
 <Zk5HvUtMyWU1dssO@google.com>
In-Reply-To: <Zk5HvUtMyWU1dssO@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 18 Jun 2024 08:27:30 +0600
Message-ID: <CAMpQs4JXqH2zfwpuoMp5hFkCYpHrXLNcR81t6PfFpBYouK7inw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Input: psmouse - Expanding the psmouse packet array
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 1:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Binbin,
>
> On Wed, May 15, 2024 at 04:58:56PM +0800, Binbin Zhou wrote:
> > According to the current design of PixArt touchpad hardware and FW, our
> > single packet data width needs 11 bytes/15 bytes to receive the complet=
e
> > three-finger/four-finger data in absolute coordinate mode.
> > Obviously, it exceeds the design of the native driver, and we try to
> > extend the length of a single data packet to 16.
>
> Please fold this into the patch adding PixArt protocol support. There is
> no need to make this a separate patch.

Hi Dmitry:

Sorry for the late reply.
I will do it in my V2 patchset.

Thanks.
Binbin
>
> Thanks.
>
> --
> Dmitry

