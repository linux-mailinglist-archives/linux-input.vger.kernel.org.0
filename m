Return-Path: <linux-input+bounces-5887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C7895F948
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 20:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14E91C21D77
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 18:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2F198E93;
	Mon, 26 Aug 2024 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjOFe07W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AC198822;
	Mon, 26 Aug 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724698759; cv=none; b=Yk0Q18RWjWwFSGA6RpiA7qy+f1mfrBwo1co4RT5xPhNS0gYyAqUi31HIMY0hKJXenCWBpK6XESaxa/MDke47YfGv0YkipAliq+LJwe9Lcd1kCDMLyE0mYBsvkI5zJqWZB6pelOS4HPEtEuAb4nLtjL3xH4g5r9/HawSWTVRtszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724698759; c=relaxed/simple;
	bh=w7ZLaOAld6ib7gFTbrW20kE/JRnuNVjh2y85WKNfY/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMxHnvrQVKq2fhz6fOl8XTuE3ShJWn8xdIxz8RmwFTHV5YcKxNeeTtMf5cSbmZPPpHGT8b2A6vt5D5Fq/bVe4l9oR4MnqgnfnHu4NlDHq/QEN7iIi59EntQA5XUi9GfsRsDeSZhLFVlgTvBGxL8DwOzvtME0cGyayVJshka7gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjOFe07W; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3dc25b1b5so3100998a91.2;
        Mon, 26 Aug 2024 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724698757; x=1725303557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HdmEVyDQG17ChPOr907PVEIjJwdh8VBtXFzrwwwINI=;
        b=bjOFe07WU8oXFfq5ZuwZoDm2JPAtxzxrj+vS0e15LncP+opA6nZsYOXh3qB6No5XWs
         sE7RnzcX8Qmor3RRiA8wxaUjiWkjphOLDlBySUU7nGH9GQrVwJCPvRhVTJzlq6bJNOGg
         9JzuF0/DRYAaOqB0IFi+Psi43e4eDyTCFmQaminCP5SoAh0pt/KTE+dwYR07GiOPprcc
         E7olTsLLOKhcxy3nzmofRyPsY1mjYZnomwIS0il/DAy2Y0AmSBctdsVkNLrhiN6tg+gv
         e4LYFwXBi47NSJhoy42EI41Uzhp2gMglW4FEJxNMSva2siRZWLQEwRhW4IF+hUYLhAlT
         avrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698757; x=1725303557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HdmEVyDQG17ChPOr907PVEIjJwdh8VBtXFzrwwwINI=;
        b=jyNwX4GmHRc+DLuEBxvNWjgDkGOdE7h2aX44M8DOEyQ4EIX8K7fbXdXOOVKa9I5gcL
         MUKEbVoAcgZSkPPJ7aa8WuSRhPD0ShZ2nnQ4xWvApqDd6t3VIQT8/uLcCIpviWIKRGO+
         LbxmnWNS9cpwe6h9ybry0t4OXC+SC1vXF/GNK+SBHHoSDSuqaXBHKmsaqyOnptQNxf6c
         wHYfFYxqGLaX/mUsLtpvPbXxJlxMKnN/15Rk7peaXbwwfTzb/CUOGQSlJoFNTkW256zb
         iJeneKAcu5K0upaQ1YLT3npMxZcV7NWBbAj4SX2gqnOxCxgn5304p9P3VabOPPLDKZGu
         D/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUMJjABWlXZcuSfrFZoBfkeexA5Hd2sQ5e0EerHIQtrMnGfK6PsX+NZ5/xpeet5klzegqM2V/2kOSBATBA=@vger.kernel.org, AJvYcCUdas/MPQG6gYeuyK+Ye9HAPCFE3W2YRRg91cxKtheFKnQHWh22tuY/Y6/beTm7J7GPkrANxPAMuql4pMlz@vger.kernel.org, AJvYcCV8LGOjQBCqE1BWInn/h8qqJHHRNAHdUUnK34P28hvU/Veu29BHc5TZyheWMWpTX77qADZWrryxQkTL@vger.kernel.org
X-Gm-Message-State: AOJu0YxnUd4XvBSiTqDFGpO2CT15cx47DtcBdFMewKX22/VC/wK70Xcs
	VYyfVVdU5YvOuer3QUAsDYkL7rsejYMgN2sRgqt5lhwwSQUU8DECJatugg==
X-Google-Smtp-Source: AGHT+IH4eyWQA7Wky0LcgP1yStfTpd8Lefa2NZ/4FLxN76r8oGy07r3B58P2jmnq0vMUfNrZtVnRvg==
X-Received: by 2002:a17:90a:f2d7:b0:2ca:f39c:8d76 with SMTP id 98e67ed59e1d1-2d646d56c17mr10278825a91.39.1724698756732;
        Mon, 26 Aug 2024 11:59:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fcdf4sm10171694a91.1.2024.08.26.11.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 11:59:16 -0700 (PDT)
Date: Mon, 26 Aug 2024 11:59:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v6 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <ZszQgR6CLu0F3voc@google.com>
References: <20240826162302.960732-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826162302.960732-1-Frank.Li@nxp.com>

On Mon, Aug 26, 2024 at 12:22:56PM -0400, Frank Li wrote:
> Convert binding doc ads7846.txt to yaml format.
> Additional change:
> - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> - use common node name touchscreen.
> - sort ti properties alphabetically.
> - sort common properties alphabetically.
> - sort compatible string alphabetically.
> - remove vcc-supply from required list.
> - deprecated ti,x-min, ti,y-min
> 
> Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

