Return-Path: <linux-input+bounces-16005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DCC4F9CB
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 20:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE35B3AA654
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 19:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF067328B55;
	Tue, 11 Nov 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAjKBgPp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EB72FE566
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889637; cv=none; b=jkxy/dBosGN7VB+sus7fZAvlHzfxj0fyFzQt2IaP5Giozuu1fdjvI9a4avHq8pPdbpuurV+XuK3xO8/DF9XsF4Kp4BZIzwxwrf8VSEssdRp5WFppIRuiL+F41yBAa+NvvfyNMZNQiwMuAfsVHhU3titcAVQmA6oMUaEMo30LipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889637; c=relaxed/simple;
	bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXY/wkqtOI/dBrdc+PocMza/AF3vrUjYykgSqDoWb8i36OxF31JQrtvBcVtESL0jZpVCgjGVkgJTEiTVGo6AgYwBcb3/lCeGBxgBAmowgNV62n4WgSDrtl2oUC5cAaab5VM3RPJF1lpg6BpB8MTiC79RLkR4DGUIIBpKy0dYo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAjKBgPp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b72b495aa81so17098766b.2
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 11:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762889634; x=1763494434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
        b=RAjKBgPpRbyd5u34Ww4SKPkv3x9dCYSuyRAg3/JVhHzBMJot9xOKFkA57o9OQiJvgP
         vJGQkBhFMHCiwxuBKoQxyQZkM+KScpg7SBC7oz3Y3BeZ2PcqsAwwmXbPgA4Gft1hazfM
         3NrQ8t78oBkvXV/jLsAfmiHLycDe6F0Kz/QomLfqyqI+EQsLtXIA1n+/ESV6lqoM6Sea
         4Wu6d2Dnw5luT8TGKOvTHeVrJVue6Wii0s3gQLmn9dEiurtAd+eTbnUW/GKLsT6DhSCY
         XeQV0PJfzRnb9V9U28202GuAGMsqwL6u3zSiH4VJI7d9kn+fLGfXI0zxml5p+MZ5UBid
         9d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889634; x=1763494434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
        b=nFY3I7p1P/RFh0SMYZOo6h5vw6GJlxPn+sMAnw4r1g335tU861smZXtiGsw1hOkZIM
         oMdapeX6asA+kI/24uPKjwfA9Qy2hj2somHyimsLDNV2hLQRV78aetPvdIDVtjMvau5y
         BLuXxIj2fvytWg7acuRNihG0Kk/XyfgXsSA8Pj+ht736tSuONRxBMX7H0msXS/yGbSTi
         chjOHHKBFlzgmCJoq31++HOU3EgM2V4c1Wnax8Za3zqCq2CyMVK49CtBemrhBjzDZD2J
         E79ph/wHfJoqyWccYJvVu3SbN3M7mJgO8dt/SVYP5W2F4rAQFRnpqn7GETsNt+TeBM7Y
         tTBg==
X-Forwarded-Encrypted: i=1; AJvYcCVJudZo4Wy2c26BSq//V5Fto4UkrRE7Y9xF/eq/a+ZI8+dog7vCXsr2x6PdIm2ZB4ulm7mu81QBgWhlMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/NQJVTYf4QmwxUxR/2IvBScSx7x3KSUkVCKOVlWwLu7JU6c/r
	tzlo6jw3uVIck3LttiLCdPhnuzL2th+1w/7IiS+J0poG7JZhismWKBaN
X-Gm-Gg: ASbGncsB2IYIJ0nKUSdSFtRaDvnDgVHX/h7coXHgv2HkPiBImFJmgigeZuPkPu60ZtP
	/EVzlbf0KY8IT83hPClB0chRcNKWtAsfuW0nD+w+9MY/oDKMHFIeDL0r082ySXFcDdqFa6CCYx8
	eyitARo9wXDKpWucXiqE04xcpcgel4EreLGp4gHMOzXMOPIKt3JtfMgWtTXarADwgKJ2QXJcPo6
	ntEWkSy2BUXZ5SLGQVkpbXKlqRD7FiCNL9/whMR188RV2nOx0w6jqjI+MQiO1TtEymZxg7uvKLA
	ZSVK1v8l2jzwzfOKOUDOnKzIi3Qy0teAPewEMJKGeFlDT6AiALms8D+DNHmJiCizBIfYFAXX1rx
	sRmY0R8OFwS4JQI5Ne/xDJEC5NRstcYM8KfysbtAp6bQklZ/zWBT66v0NNtUn/eQzkONfPTJQ2C
	lkJzl2lNv2pA==
X-Google-Smtp-Source: AGHT+IHDUjKUNAsSr1F3fZIpUNhiYNKUcUmB/BPrX2k8vNUcQxHLIIesAmw2W01qUzcV5/eYxTxFhQ==
X-Received: by 2002:a17:906:fe44:b0:b6d:608c:838b with SMTP id a640c23a62f3a-b7331ace065mr28182666b.45.1762889634237;
        Tue, 11 Nov 2025 11:33:54 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf312240sm1428843266b.18.2025.11.11.11.33.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 11 Nov 2025 11:33:53 -0800 (PST)
Date: Tue, 11 Nov 2025 20:33:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Rodrigo Lugathe da =?UTF-8?B?Q29uY2Vpw6fDo28=?= Alves
 <lugathe2@gmail.com>
Cc: linuxhid@cosmicgizmosystems.com, bentiss@kernel.org,
 dmitry.torokhov@gmail.com, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linuxsound@cosmicgizmosystems.com, stern@rowland.harvard.edu
Subject: Re: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli
 Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that
 needs HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the
 RGB brightness with the physical knob.
Message-ID: <20251111203350.3c9a669e.michal.pecio@gmail.com>
In-Reply-To: <20251111074205.1533558-1-lugathe2@gmail.com>
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
	<20251111074205.1533558-1-lugathe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Nov 2025 04:42:05 -0300, Rodrigo Lugathe da Concei=C3=A7=C3=A3o =
Alves
wrote:
> Add a new vendor and product ID entry in hid-ids.h and register
> the corresponding device in hid-quirks.c with the required quirk.
>=20
> Signed-off-by: Rodrigo Lugathe da Concei=C3=A7=C3=A3o Alves <lugathe2@gma=
il.com>

Usually one would use a shorter title like "Apply quirk X to device Y"
and put explanation/justification in the longer commit message (above).

Regards,
Michal

