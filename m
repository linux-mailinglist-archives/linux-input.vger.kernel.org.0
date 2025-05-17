Return-Path: <linux-input+bounces-12403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642ADABA783
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 03:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07B4A4C158D
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 01:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0EC5680;
	Sat, 17 May 2025 01:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBi5CcCj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F6256D
	for <linux-input@vger.kernel.org>; Sat, 17 May 2025 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747444677; cv=none; b=jxD1GRieeomPnqucVOuVlmBU3QLxJv9fjZ39C7IbXpl7Wh35LSEhU26WPzR8dnksVxhpl+nWEIP8023RVFUOHnvKIfhQP11RJ2ZqLYn7+NHIT3GVw8SbnTAuOkSXzcVEX9HKKAQs5kOkdBVUoWSZxZHe9ilBbhDmvE1c8qpYhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747444677; c=relaxed/simple;
	bh=yLov2UBI9U8XuhImpmyEsauyF41FxpsCAfkNsjKBr2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMo4jcwLJjhzpKRp5L7qwuA3/yDYvPvFGahq/zqIJKGL7TpFP0Jm5qhFD/7GMsfKOiaCaqniErHR5k08lIOriaOkDc+whHBm0TWxKQx/wYPj48HIUL9Pw5U84Ayc59/0i9MvzfHhBRpFynt2EbjGGLVvhT27dObMEcldeKm0LwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBi5CcCj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7424c24f88bso3583634b3a.1
        for <linux-input@vger.kernel.org>; Fri, 16 May 2025 18:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747444676; x=1748049476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHkiFbAB8oyJBEasLF3VzPwRlVLyfOvZ7qojp1prEws=;
        b=PBi5CcCjs/lU7dNk4rtCyhqRj2t1V0oT2uMqhjQGyotaaSpIPfbmW/h/s5j3YFPof3
         UoRn1Ajomnoyr2St9uBaitjwK7qZsXqai2PD+D0RyunVG+V7xIdMM2c0peJOGyiO5js5
         oUAjbbwmzDjubDVR6iD4ILQjTsHRm1l564qaLLzyCGcwadyEGG/DFaVyywdEvfUMQzIj
         nlaw487CxX33HMmC9tMvREgJg6JShj7HqUUcnCMWnNc0CwfIQSRg2z60xu76cMAJHjJR
         YFeAMQeoMEZQTQ3spFbFmHprqg5boWgfLE+BBhjKxhz+5mDOafSCQ2UOgJFpch0ZK/b6
         TfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747444676; x=1748049476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHkiFbAB8oyJBEasLF3VzPwRlVLyfOvZ7qojp1prEws=;
        b=J917ZGlycXWGJw8gZcRU/UHTjIPLL8wk1uxAD3tSCzGHBya9bYp+thxJ+FIe5czY1q
         aInRfr77BJT5rQgYMfKhYjwhuUlv9PS4G7WIAi3fnAsPrsWGIUioiNZTBJwADpt4hlBF
         j0OoU1tOMFCQf4xXeANl74dPrd2DdQYgVnLRVl8NLVdPvW8Kvr2qnoY73n+FTofn55Bv
         s1FxGIaMNaoSQENRAWpmZv4+QAC2uf/vcj73C9jJ6MaW+yW9QBFH5P5VwzWy62xI+C/F
         Xq8KQPAcgIRJGwuHBcqI1YNDIEwosiaichFdYYOIbzuUveJC4sHFTaFm9sgYz/6Ozeq7
         LXlg==
X-Gm-Message-State: AOJu0YzmN6mDxV/hxvJk5D8XFEyLrT883o95CTrv+jvq/No4qr9iPJw8
	tWNgsJNTBJW8Lw5N6RzYKexavW2oxlUlS/ek2sSMlk4mjaiDhKtro+sQ
X-Gm-Gg: ASbGncuUyxlHMiCzI2HmHDzsY0+7RsxrBpEtWtNPlvpk7ht5cq37qblRDLSD3a+1hUZ
	vnK/t5r4+Aq5Kg/WOAWWqeZDUpV00ZekfJ+DhHilRDQaWIhnFp2JoMH1l+EvtF7iP0WEJIWPSlM
	EjlFrDnlbIUVRLiGB4lvcO7/8llWlVZCLmIUqfz4qGvxy/eOcoH2QOQL0WBrugupdnygW5JWSMq
	DQ0XPtlm5t/mnG/9r4L3luVVcq90AnshC6YaJLHiblCzg2NyU3ReKiBzQP4+zPimMw4tWeT0GZ4
	V+6iUWnW32snHJKd6L6iR9nx7uCnHyJvSV4enxbqbFJcFXn+f/qZ61wccYF7o3o=
X-Google-Smtp-Source: AGHT+IGXDD1WJjXZ/7D60fcO6/IixYBd+m1Qrra/8digITFlMDTlFIZKAhoek0tIaGd/FNMGMy0cjw==
X-Received: by 2002:a05:6a00:391a:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742acd5115amr6197082b3a.18.1747444675653;
        Fri, 16 May 2025 18:17:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:61a4:bc81:5a8e:3929])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9738f13sm2165103b3a.74.2025.05.16.18.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:17:55 -0700 (PDT)
Date: Fri, 16 May 2025 18:17:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 0/4] Input: xpad - More Xbox One improvements
Message-ID: <rhdifuc7rt7pvx22h3yuxdm7rcr3avmul7pinpnbswgjkkg37g@wulwegeddp7g>
References: <20250513225411.2718072-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513225411.2718072-1-vi@endrift.com>

On Tue, May 13, 2025 at 03:53:58PM -0700, Vicki Pfau wrote:
> This patchset adds support for several more controllers but also adds a bit
> more "correctness" to the initialization flow, and a quirk on waiting until
> the announce packet for some wireless controllers that delay the init flow.
> 
> I have a WIP new driver with a proper initialization flow based on the
> recently released documentation, so hopefully this will be the last needed
> patch that adds piecemeal per-controller fixes like this.
> 
> Pierre-Loup A. Griffais (1):
>   Input: xpad - Add the ByoWave Proteus controller
> 
> Vicki Pfau (3):
>   Input: xpad - Allow delaying init packets
>   Input: xpad - Send LED and auth done packets to all Xbox One
>     controllers
>   Input: xpad - Add more controllers
> 
>  drivers/input/joystick/xpad.c | 57 +++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 13 deletions(-)
> 

Applied patches 1-3 for next, patch #4 for current.

Thanks.

-- 
Dmitry

