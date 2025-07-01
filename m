Return-Path: <linux-input+bounces-13317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A828BAF02A8
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 20:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA6D7A1137
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 18:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9FD283CA2;
	Tue,  1 Jul 2025 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuO7ikj0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC827FB0E;
	Tue,  1 Jul 2025 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393595; cv=none; b=pr6wjZ+QyxuUJiNuWypdiLOQVVDAW7eh2/OYBAPteph0pFoh5lAUxx1HCuBA6b0eLCtjPrHEx8+s1PXbDS08E8PA7KPy0IvlDOTfelj4YtZHRL08IKN72DIuOAHJ34S7NEz3I617JUqAlWcpUYu38rWEYJ6Bwhrti/IzI+lZjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393595; c=relaxed/simple;
	bh=eAu0MRSHV6xH4249WU3u1VjZk+3a4KJwctP9GEQDFLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdehC54EwMk0qctLfqcT7C2chDgfaRX+zz8YCcHc6HHHgek62mZDb5Gc05lBhOqeAI07yFEU9IRPTTCdqxf1zEBHEF/4GAd3aht/ttToBzZVL3EVz2YlzxkY2L+iW32hl7rrV9+lieAlIgzlKmF/9u9qmbkLvieod/sh2UQnDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuO7ikj0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363497cc4dso50664355ad.1;
        Tue, 01 Jul 2025 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393593; x=1751998393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nepb3zOB889c16aJ25u0uXLI1bBeotorI3Pi5r9+cUo=;
        b=XuO7ikj0itsxaV+PXkEeNna2tAsfd05B/k18j6eRdgg+duxD4pZXQNOWyOSRx8QEds
         DpocrsyC3itdCwP3p4dETc8eGD7wl8K5gD3GdCVA7BObcLFbo782kq18NGfrm5w+SC0S
         SyI7RBOK6A1YHuyi3+JOJZgnJ/yhEE2EoFrwutPGZYydE1BbpFL5TXt+MVyC3YY/g9tT
         N0w3isZVHZQqP4+cvlqtTKr26y6J/DkkmwjT1ttSdB4OGTWI1jcNUH31GnnhYUZ0iuEV
         fbVwZ/VP948SAYT3ceomLiT4Z23WJQEG25EhOvDIYZeDiHmaKR+dKFalAMLxSKmiGXIx
         X9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393593; x=1751998393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nepb3zOB889c16aJ25u0uXLI1bBeotorI3Pi5r9+cUo=;
        b=UecGSzwD/ifZfc6UBkv0ZsCVk3/ww9aGpeDgpOn5a7EJDSY706aSYpg+7fg7DyqVvd
         VBgLdX84z+TlqjJghMwDslOsVeriTKK83p3krlCYD/IuWMO+2uTxXQXwqW4p3cBwx3Eh
         oiXjVd7lbpCxTe4+agQD1ZHKd5jp5zCRtJMqJpzapXUpiqQHeH7NHGxU9jYXQ9I0GMfy
         kkMAPl1H7BrDdYF6hcsTNReZxUpiUbfpMBPWgD7CNzYIGJCXibVC9lScKnK54jQhhMji
         0y424lkW4B8gEfIv1Qt0TD/ttt8WC4WRYon3uWKcxS7g+IJdXK6DmThAcfOAJYtbNuCX
         Uh9g==
X-Forwarded-Encrypted: i=1; AJvYcCWrZpcF8zCIQpPuW7O/S2FS0g0Szk3VsYHdAYpYFIx7416i22SghBd9C9F+fab++T0wPg/Dpcl16f3cV0TY@vger.kernel.org, AJvYcCWx7YpgUtq/V8rrRd6zdECYIlKwzp5Ev423FpSRwfjC4gGSNhzd6K8NCnn21+ZsgyWrLh0NVSMmjaQr@vger.kernel.org, AJvYcCXyNgyZspOks3hvfqsInXoh0TjjpWbj0IUozQNCkGUk9Wbwr3lePSsyMbdxsSlaLPuT8rNZR6Irr855eCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8RSdf2iN4aq/qL1x5AKesuK7MAjquiAzgcpjyHrGyAzX9llS
	U9HwDocgZn7yPv1e7Klng16tolypxYtb8Tvwi21r9Q9/SLZ/bnKgNdwJ
X-Gm-Gg: ASbGncuhtBC6nF/KjHB4Z1T/VBp1Lc++LA9AG2I+Phl5X5a8Ssqt2VhFdQj+owt4Q5m
	8q0n2rD782uI4sadwuGm9F4sRsSwUXuSGp/fPtYM6ahEjhhfY+1DWXQgUXh2FpEH7R6LUBmitAk
	L8CYPodCruJ1ND8WvmzcQdP893oy69t7vFiVnPxyJL4zKLNa0W6RkqfHBMdDnkTKOSPk2BYu3zZ
	rNHq5utKSF4C0pAtedbuTunTyvN2rrYJf5veBAd6KkOYp2lC4/oF+Tkyfidn3Gu7KkaLImtgaOz
	8OQk92sfvXv1i/Mtq6mGaEgvDkc6YRB2dphT5A14RfwdHELMQ5li34JOEjN1hA0=
X-Google-Smtp-Source: AGHT+IGAdFjKL0rEV/0i5/agWfz3gy3C3R3l4wEiE5tiTp8xVYfcABnycX6766pzilb4G+WLEWj9pA==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr287205225ad.45.1751393592975;
        Tue, 01 Jul 2025 11:13:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b85efsm109583475ad.185.2025.07.01.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:13:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:13:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt
 to yaml format
Message-ID: <ooyp7e6gubzqxavo7aadie7xgo4qi37uarw72hkhbbbolno6ht@y6fve3n3rcru>
References: <20250529193241.793678-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529193241.793678-1-Frank.Li@nxp.com>

On Thu, May 29, 2025 at 03:32:35PM -0400, Frank Li wrote:
> Convert tsc2007.txt to yaml format.
> 
> Additional changes:
> - add pendown-gpio property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

