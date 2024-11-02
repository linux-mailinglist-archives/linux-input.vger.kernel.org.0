Return-Path: <linux-input+bounces-7837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB119BA08B
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2024 14:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A19C1F21892
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2024 13:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75834170A01;
	Sat,  2 Nov 2024 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD1s8Z16"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52171BDC3
	for <linux-input@vger.kernel.org>; Sat,  2 Nov 2024 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730554419; cv=none; b=iPI6hkqX7vnwIqTYjRGpEDPPMX7POB9vVItwzV3oFmu0xp/Xfl5R+yy32JA0iCbP3iawKkIwgGdCLrZuMtLrr/T36PX6wV+JzjN79Xfa73NcaSipTe+1OtbR6K/UDINit369X2eA46dTrIkQte5IcXKs6wVO6xLvbYIdXRNrEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730554419; c=relaxed/simple;
	bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=S0o0NJgp5g5Cbgh67arYg7E0Cne4C+H/YHwKw1MVIuMpbO1zSdmX9uY7XDB1eXTx6KLmNRB5bvz2PHNO4qZlHiKRRCFiNX+dE+zCkX6w3TON6IjkjsAjfTCYgrwpoSz/MC28jHzsUIYErb0Rn3Q0uq6fVBpA/r96sB6p5rW9/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DD1s8Z16; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a156513a1so468242766b.0
        for <linux-input@vger.kernel.org>; Sat, 02 Nov 2024 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730554416; x=1731159216; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=;
        b=DD1s8Z160Q5QvcXIPi7LA2J3Jok499CvD1znEOWjg3oSYp5l6LvrAlfb37jMaKvVSs
         c0f7NZ42Y8xbiYHje0fqg7KFtnJDAaoQuhyiYm94sDmkyV93Mb/j514RNcBZo+4o3GVN
         WH382MY7IGhAcSxnLV0q+snd9c4ihWkYbOqXUTgqhHMHGZaaPlTLpDVPW1ICZaWmCCep
         xgWh7WmBUisoargb6PtFC5ZGZDYila0f908aFZ1PP0cbAA0uUiJDQeSnKCYnoVzGL9q5
         3TxTc+zsVzYYAmxOp7uqPjm0tHblXcyFpXarkBeJ/dgY+93TOSNyHt1vqJI8Orl/DN9O
         UEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730554416; x=1731159216;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=;
        b=SDdiPggcjvEm98eVnEOBBTVwyOM+JG8o3kAXPCIGXTwJoihz5ByHtR8GUp8kNUb3AM
         RijytlR8seJHMxG3fob9z8C15I0RLWHNxHDtx39jnacC/Puocae9uC6qCmssI2Wty04q
         4gMLCqB/BUqAGCtCkkGylgwCgpAw/yfNRRZIXhD+NplikUzGipLDHoTA44W7tuxpaXZC
         rSu8ip+KPQVFneHd9bagsPeNevA+R0KX9PnQkEcBeQ00PKKrs5X9GxQ4wgkdpoPD3w+8
         ueHYm7pTfErzheYTbJ9VbRMx4RZi8KMCO8szEASOsLT65nLRfuOF8hToxdYDJ5yoA2Sy
         Yq9Q==
X-Gm-Message-State: AOJu0Yxh01VGYgaNN+j2goq3jg7b4gRfAMaiaOOCzQ6P1Km906yEC7Iz
	O/i7cL4Rxl/PqZ2+/za55FEE/7LnyjOZjW/0OfUCWYlcBhXSGLxapPQIAQ==
X-Google-Smtp-Source: AGHT+IE6DAgwaV9IvnYVQ/i1lu0QCvaslhG32NdMOanv08h4Xvvyz4CSVpxHrCScgKpEZEIDL1GUCQ==
X-Received: by 2002:a17:906:794b:b0:a99:5601:7dc1 with SMTP id a640c23a62f3a-a9de61d4377mr2486581966b.49.1730554415761;
        Sat, 02 Nov 2024 06:33:35 -0700 (PDT)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56493ce7sm308327066b.39.2024.11.02.06.33.35
        for <linux-input@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:33:35 -0700 (PDT)
From: William Cheung <cotlscnasc95612@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <f3841caa18dff01dbcdf290630fdd9cd9fb72dc22e87236ce39f429da5e616d8@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-input@vger.kernel.org
Subject: Proposal for you!
Date: Sat, 02 Nov 2024 06:39:22 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello Dear,

I have a lucratuve proposal for you, reply for more info.

Thank you,
William Cheung

