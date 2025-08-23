Return-Path: <linux-input+bounces-14265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E4B328EA
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 15:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 488A4189DFDA
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F5C1DE2CF;
	Sat, 23 Aug 2025 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkRYh3ut"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E137393DFC;
	Sat, 23 Aug 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755957208; cv=none; b=j0Ys804rtSjHkdROiTo5bxPjKEHkniMYwtVWklSwkj9U2o3pBgx2OhUZZH6ZjgzZOtC7IzpQA3J9/qEYWXsAm+g3CoHcDa9RzSx8xkcXNNJrdjhfTwN2ywiiP+HU1bbWoPw3dnDgcQWr5H0xqNbVKls+qghxjx25mEOFC8+Evg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755957208; c=relaxed/simple;
	bh=Fd8ymC5jlp8OxJxQuxCLc5Vs/zhC7WxodBxyV3nI1yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEwhIHq2q35Zn15xp/55/EwOzUFTVM08WbDg3pNvVZg8e8qJkqN7pVhLIA0bj9q4itUT4MHl8chrZT1jhWRuVaPgAHY2NYBqPmCW+sFMLQjMxDtotYdY4xHgRTXAOSZf8JF+MCIH0Ik0fhireyVfwC9Up22eCWqSjbDCczJZLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkRYh3ut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6B5C4CEE7;
	Sat, 23 Aug 2025 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755957207;
	bh=Fd8ymC5jlp8OxJxQuxCLc5Vs/zhC7WxodBxyV3nI1yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkRYh3utCpHh6bEpaD76iHUnwa/afBk0tdTWF+dddGqcaHUUUNIunBkpLvwU4/OBB
	 IbKMHPTM46z/15KP28U+57o0lW+BuE/lA9BeL/NYzA/8tN/MzEi1pFc1oZMNrH5ykU
	 pjfP81KlYHkiUOXcOoAdwpQd25diEwHlQLVWh+XZMbdPnEANKj/Qrzc9+8W19+2B/D
	 YLb5u+wmsHnhIXCEAKAF7ejKeBWokWCwW/Z2bMPRAUypZaHuv79idLYqIL/1oSWIHV
	 lVd7fBn/f/oCje0fewljMChL6bTqqfq4hYeGOl0l6xzX7tdOZsHsDNJVo0lIG8b2Ab
	 45faDquY1prwQ==
Date: Sat, 23 Aug 2025 14:53:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: tsc2007: Document
 'wakeup-source'
Message-ID: <20250823-dab-overcome-0311f9262202@spud>
References: <20250822213245.125901-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mhl99yDIEY0NB1MU"
Content-Disposition: inline
In-Reply-To: <20250822213245.125901-1-festevam@gmail.com>


--Mhl99yDIEY0NB1MU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Mhl99yDIEY0NB1MU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKnH0wAKCRB4tDGHoIJi
0m5/AP9KrKAcQ88gr84h+MAUzcrR+2a0QazQOrBHOueHXM8mowEAlfW2FOA+IL1V
qdLrqYY5YBghm8hV7YtfiqS/p3dskwQ=
=GX2e
-----END PGP SIGNATURE-----

--Mhl99yDIEY0NB1MU--

