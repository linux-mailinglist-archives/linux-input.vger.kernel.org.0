Return-Path: <linux-input+bounces-8313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332309DBFF0
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 08:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E282E1646FA
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 07:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF06158208;
	Fri, 29 Nov 2024 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsJDp3M6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDE1386DA;
	Fri, 29 Nov 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732866852; cv=none; b=eRGJl4Xsuy3YlpcmBAeyFNfhArWpjvoWyNKdcRGL78+RyCM0xvdJa4iYqcLfdsWUtEZGQtE8gqicN+dBy65JeWsXVjkZQXaJeiwhgC8qHgWQZ2S3h9DP5NHTi/f07FX5+CGPAYMzxkxP6gMA6EcufkgBcqfG4bDTgvycdJnRtyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732866852; c=relaxed/simple;
	bh=9spqvrZ+LoHD+ZOLFz4+YFT0uhD8v0cffSFDzPA0+pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9QZ336zC40s6tY8QLllvqNVesKtVeN4qXt4NTlKtnaXY5LYYb2dias6dP477mdBNUklNES/BQyExUSfQcUSYOskZVJuWraZumU5Jth3rigQFfgN/2RP6NadJkPiUYi4xkpVDP9uOyyrmyF5vMj4buCCJIhyZ/7gFaAZe3xQ6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsJDp3M6; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e387fdd1ec4so1118601276.0;
        Thu, 28 Nov 2024 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732866849; x=1733471649; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=jsJDp3M6dLGjYCVeitpJgX7n8tl72++IaJoiBcRrKrBTPpBJkCYwaujHr9LuPghi3d
         iR2kwjI7NSRz6gP3E0N/D8n9k9NpqFE6YCyFSe7GouulWo0SfTYrfTAY5YoP1S9Add0P
         vT9M/Y97/uNmIRkoZsXl0W7q0wXq7jnhivkeR5kPa2PjXaQvEImDSpN/Tre2NPMhAKNL
         7yKWjN9HWO77G3mPIGSKD11l/LvVRW59JiBlTWTBVxTMOy/z0m6NNByuh/9sW2d5e/CN
         xd5J3sXyAYdQ3OL5WP/02MCZBYcimUS3iy+yVizvpD4dWfQmkjtumHW+am+6a6suYG7W
         CRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732866849; x=1733471649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=HojVlLTsmxhs16AlzQPvBBTe7fK9g8DG8V1XOpYwDDKaWegiTUjbyJ+5EqRDYh9SHz
         3nvgbz/6nGcpRpu0jk1lPnvt5j6kWw/f8Gq73agiynoUl2yM7f2Xg83dhmUPW6Rr9gpj
         whb0yQO42lFTK9ky5XzssiI25TtsI7XBU6OtsNkIANqx5XnRAIPD86RYzTIRvH+832wA
         rQ/oPrvNOLGcmPHJFpM1tSTckswiB40W07BmyH58qvIwAI5GvIcCH8+0IXLrAuC5R3L4
         RTdeHOCtZtRyuRITk1sfGfEpVTExVRvvXNRz1qMMcBSat8CxG/RrSlWngO1STt8Jb0y+
         +h5w==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZjEBGQe9yIfC7H9ThRifjZiKLUeG1YhQc8dvzRV6jbP2Hg6wDJKbMrk1U5n1Z6FLG0pDdJHF8Zq42gQ=@vger.kernel.org, AJvYcCUf6G5xvJsNkBz20WfgcTk1JZBwsXGF9g8quFUztbFdIme6YlxIC0OJz4kjKax1CkBr+DxvdyrR0bO71FXo@vger.kernel.org, AJvYcCXPUCaFoMylgtacSPB54zRfJLNDDfdnvSoV+MZWnlhDS5I5LdCMuf16KRc/g78+HFWQSPYKMNdkaeh2@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+IIQ+rVx3qIOuxUTTS9lPqg+9LWLp4GPwwOaOEiOjGkU2Jdg
	XL0Eh8vdjJRs1L03b5Z8wRCXH3IAx4e1WP89RrZjxiOyCfnuMLcLAfz5Eu1XMkQXXGCQRtv6d9Y
	jg6YjfHsJevXSphb9FY78oaHF+BE=
X-Gm-Gg: ASbGnctRLwqto/9oSpSphTefVtjFN6RfejCRIPiTuyrYgzvfREtS1MbkvI8Y1XjF/di
	zgqPifsCmIcj5BYcnuPXJ8cw9wxZeytGt
X-Google-Smtp-Source: AGHT+IF8HFusBVWylrBABsLEcXExgX39TFtK9CKcRntzgb2j/Eixg3DOFVeP3pBNmvcd13VUQ6ALY6h5mUnCdbvtq3I=
X-Received: by 2002:a05:6902:114c:b0:e39:772b:4bc0 with SMTP id
 3f1490d57ef6-e39772b4fc5mr5024271276.42.1732866849543; Thu, 28 Nov 2024
 23:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-1-76cc59bbf117@gmail.com>
 <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
In-Reply-To: <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 29 Nov 2024 08:53:58 +0100
Message-ID: <CAMT+MTTRT+z2i6qrqVo-KVNuPF2o2OV5HpfhbXiAaWU0TBr-WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 08:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +    description:
> > +      Calibration blob supplied by the bootloader
>
> What is the expected size? Fixed size or maximum?

Unspecified, 1688 bytes on my machine, but the firmware
has a size field. Most likely less than 4k.

> Add it to the example.

That seems counterproductive - it is a ~1.5kb blob,
and it is supposed to be set by the bootloader, not
by person writing the dts.

