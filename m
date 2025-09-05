Return-Path: <linux-input+bounces-14518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516AB46378
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 21:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B31A65CCE
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 19:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121727A114;
	Fri,  5 Sep 2025 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RImwbbs/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E62AD2F;
	Fri,  5 Sep 2025 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099866; cv=none; b=jy8q8WGQXti9QYUVYgq1jJdA0/prf3+SBQrPYaV4CZlvvsHwg3A7HWrRzlJwgwmeEv1XL7L7E3mS4mFIca22/S6zZfhD3FwZeneAGoeGkm1yVGKdlDUDtJ+Sc/w6uTehfwtvqpVx2Qty4pjc/v4P9jSYK0+k44FgxwzufAm80LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099866; c=relaxed/simple;
	bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUjvUmEkz87nIrnigx0XysQXyHS9gmm7xkZmRCfaFE1Qb3VM50IuQ6PDgJcMrttlJR4jOuyLYRLCFlwohfyjdvzbyf0klFFlcLSPlHr9y6QAINxsNcBBRT0LbWwXJiKKjTdMqKiiLSt93pj3lI5hHNg4SU9aoqyPKpcYdzRsu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RImwbbs/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so3072020e87.0;
        Fri, 05 Sep 2025 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099863; x=1757704663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
        b=RImwbbs/pZJJNpYgZP10EBQEHSAykK5D8YVGb7j+F8TCkpdSeQJL6URS2POWEeno7s
         FJqMyrg5KTtKgOANynRXjEGyDYMMNG5t9kvB0pEnK6uD1zDmxNl9zCObq0NyNjF1SWiE
         4FKBUVzhZd91Zt3H8MmwHAA8EqUOca7bapIBjLooYmOAFaLV7l3JkotbUW/G8QzUs0v/
         8mzLK4MdFKnmILJdz+zcv9U0NcvBHdiP5aAbeFEMlcMF/MpCF23r1sr5EJdLQ83QYMdP
         vaXYTSQAnepdhqpk0j9d4XV4DLrthbHbnvXeygcsGA6pJ55cYSIXI6NsQD+t+nfZ/V1p
         jyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099863; x=1757704663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
        b=pAx7WttwS6hN73dy9dXZhLbNrnRFTJwOW4gVltu4Hn3Wt/AqTBQ3DI4CqqixSJoTeb
         TBi+Ks3ZpyPAtadKISC47AXxjt/towFs84OcpCAmNRgbA21JiTrWhRSDGewdtvZp2KlZ
         bwGf55UCOco6PEwvDN+dzZIC0Ts85Vz5N6j4tU6Am2T+jRVbtTyc3MZuIJMVhmATF9Vu
         dsurlIVs5j7wcwvTyASf1On8QvHgE8J9azaDu2MSfb83rMH7nhokPKzE5e4j1mwA0/YG
         9YbL7MHN5bFFlIjd2SDI7cZ44Tcxe8ifFm/yWvlwLRYYqOfyUsfQllwN5+2d5/N6f5Oa
         jgiw==
X-Forwarded-Encrypted: i=1; AJvYcCUDn2bikHiC5X9/ZjR0REbwql1vZ9ryuTmZYVTgFOpIH8vgtjFfwQQ/1tq3qDf6fhGXgtunai1SZoE7IAI=@vger.kernel.org, AJvYcCW7K63nmlF43blA0DLtTpuSSYKuz0urZBNi8uZRD/RMhr06AwQcf8J7kGImuFSanEwLL2nD5+eR6myq@vger.kernel.org, AJvYcCWCo51wpd4SExm6iEZsNc1GHqeivI8XY1gssSAHCKSbmXKu8xRdDFA/xU4aVM1ROEJWoM3wygn2ONmOd/xZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuzAld8UOjLLeUfDchj6iEducrhHI/JR0lTKfp/1x3I+iceixn
	rTo0HLb59vZhMB4jNDtyk510C3Lxud3uN4kLT1IfUZgY8sQfulYOCmLMUhd4hfnk/osDB9cEIMH
	1RvlY8sFohNxBw4rweytRI5HWUQ/aH7c=
X-Gm-Gg: ASbGncu56l9MgdWRi1YnTC46msi3nK818TPHjVV76BFS6Xw8hm3771dk9SiWsawTDaD
	zf43HJGM6oVOQWvtdZqYt98f6LOoWfbjHH/dwmhLmUfqMwcqHYeF1A3xAVbnxmQhSbCtV601pbP
	p3rg2/trZo6aHiIEr1foZuEAF7/NKcPDLtn9uGaB7eRCgJoPGVB/GQcsI+zCSj1FPj1htKe1wTJ
	+a0K4kBXd0dBr/7S4M+ZmWlfXS28LSQQnWMvfa0c7LYMptGIw==
X-Google-Smtp-Source: AGHT+IExNr7E9rD7sUYs1T/yf3koGRYXu/DH4f4r9pUApNVPygT+m2pxQCLbRRRJxgQIeFsJGBe+CsQwzmlorjCUV5s=
X-Received: by 2002:a05:6512:144e:10b0:560:a641:6499 with SMTP id
 2adb3069b0e04-560a6416d00mr1270504e87.9.1757099862969; Fri, 05 Sep 2025
 12:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905190645.609762-1-Frank.Li@nxp.com>
In-Reply-To: <20250905190645.609762-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Sep 2025 16:17:31 -0300
X-Gm-Features: Ac12FXz9svkM5bN90I8Wbp08WUFjnKgc2W1OxAbDeHh4SU05q4l2K1Kn6ku9BL4
Message-ID: <CAOMZO5AKcNHvRpjhmGpGfPRaonU+quT=dDJQwLpDjBxTCXkTXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: input: convert tca8418_keypad.txt to
 yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 4:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +title: I2C/SMBus keypad scanner

This title is too generic.

You should include the part number:

title: TCA8418 I2C/SMBus keypad scanner

