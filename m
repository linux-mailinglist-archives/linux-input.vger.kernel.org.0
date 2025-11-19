Return-Path: <linux-input+bounces-16218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59698C6F207
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 15:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2AA8E2FAA1
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 13:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA40357733;
	Wed, 19 Nov 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="psYoBuml"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28A34846D;
	Wed, 19 Nov 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560718; cv=none; b=iuatEHN6X65eGbjAgNuGnNlI8WFa5RRa64UmXf4n/dlyDswhsp3qeVhSUtW/gL3s7SGa8fycQII2ZoLveBPUnEGQgCTghcDzxTFxnqJVINQQ4Pu5j6pZDq21nsKxAT3V9H/X1nb73zwIEMCiXXmAfDbr3Z2Q06o1lx9r2sBMd/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560718; c=relaxed/simple;
	bh=T/XoOCy+pIOlD/I+wNCrFgeWq+r6u0+M1v1jgY727BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2nm8yxBGA1o64WfUwIP0W+WtaQpfbDfMhYVIz59yeupkqsBdGsQlo+0hpMg8PWaYlXbKyYveVmXA7lQupTrbTNdwA0O+Bx9+Hi6eiGbuQQ+Nf+JZoEqe2+mzaPsREQaz/O5/y+lCLqeKDbJkgVIDL4LXRqc9aszEqHNBrcQxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=psYoBuml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB89AC2BCB0;
	Wed, 19 Nov 2025 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763560718;
	bh=T/XoOCy+pIOlD/I+wNCrFgeWq+r6u0+M1v1jgY727BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psYoBumlbIbd3cYaQ10BzGRmKzMN6UVo8VOs0D6COzshlNT38M+ELbd8vUMxU9tIc
	 Ryhsw1nhnJiFpxMT0ke/zwYgp0jYF0xV/cMUqHoyD+icjnK67E4ownltU5roruik8N
	 NQXzQEQCIizywpqbD0lYzjUdb0yk5cr8PBXHJMf4=
Date: Wed, 19 Nov 2025 08:58:36 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Marco Felsch <kernel@pengutronix.de>, 
	linux-input@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <20251119-elated-caribou-of-witchcraft-0508ed@lemur>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
 <20251016145205.244gsevx5tdloiqy@pengutronix.de>
 <20251111110110.io65cbslrv75lbby@pengutronix.de>
 <juffz52dxb2txvolv7d3kb37urweg3kau67rb3zk42ovn4uze2@uqvbyz6nuecn>
 <20251119101007.za2373biybt24qfs@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119101007.za2373biybt24qfs@pengutronix.de>

On Wed, Nov 19, 2025 at 11:10:07AM +0100, Marco Felsch wrote:
> > Marco - I would recommend adding the Reviewed-by tags that you
> > have received and then resubmitting the patch.
> 
> I can do this albeit I thought this will be collected autom. by b4.

You have to run `b4 trailers -u` for it to be collected.

-K

