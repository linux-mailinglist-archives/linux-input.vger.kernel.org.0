Return-Path: <linux-input+bounces-4339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCE907423
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 15:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D641C22A78
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EE88F68;
	Thu, 13 Jun 2024 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDb7IeDh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF610FF;
	Thu, 13 Jun 2024 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286340; cv=none; b=rtxTqUYm6teLS24zxJZbgyn/uvyk5H5G+Nc6h8+mVmc/6gFUSKf9YxeIisgjeS4ZgRwisYnm71k0/FWrA/PLZERPdU1Nwf00Jc7Ahp2P4N4DcFlCdJYd/0yeFh3arHdFnBDxt/XknRKOzrQNGAKEscRqc+nfoKpDY7VVVlPdgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286340; c=relaxed/simple;
	bh=BADMAGvyZtj+GsRfT/NDr2Jvk9KXxvpLyvmYPtJjSAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLc8Tl0z7sAtagPGdQ6ky9qIItxhmKIXJ0e+tT2/T4N1xYi/L8SwEbinSKbc3De1YxFZA7QF9kSbtNbz7C6mam9kctjUNr4m6lcGWaPahLdDUBnG/dLdgVGrPkciB+BR4IlFrdS90WdKxNI6SfZWMv+dzodK/72pssjuGf3BwbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDb7IeDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158F1C2BBFC;
	Thu, 13 Jun 2024 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718286339;
	bh=BADMAGvyZtj+GsRfT/NDr2Jvk9KXxvpLyvmYPtJjSAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDb7IeDhIRZlRAwjN4O9eeUdvNarZGkmUanL2dReujN3n4jgUgZrFfff+4cgjhhb4
	 h6BiHUHjvOGNs/5l0eGs54fVRaWmPL08N5/eCrNtIYSOI0hZPwv6jzwcrVnbvKYK6g
	 4TCeZZZHpJHOJZ9RK+eMYj9B+3TR/tHdGwfpHdWsOyhqKZ2KRHn8QvtJHRt1YN8wj9
	 N/swWlg2lAoJ8ZnQM9JDvGW7OyZsYAPH1C7e2Pcdf+MVLzU7x1cJDt7ZfKYNzta8Wy
	 7LhBi++W/G/igZ1SNghloo1y/OOW4mfAVa1pK1tX10cXV1x48oJ44GW9KeuwDtIzvY
	 8D2gty4PyMrkg==
Date: Thu, 13 Jun 2024 14:45:34 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/5] regulator: add regulators driver for Marvell
 88PM886 PMIC
Message-ID: <20240613134534.GB2561462@google.com>
References: <20240531175109.15599-1-balejk@matfyz.cz>
 <20240531175109.15599-4-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531175109.15599-4-balejk@matfyz.cz>

On Fri, 31 May 2024, Karel Balej wrote:

> Support the LDO and buck regulators of the Marvell 88PM886 PMIC.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     v7:
>     - Address Mark's feedback:
>       - Drop get_current_limit op, max_uA values and thus unneeded struct
>         pm886_regulator and adapt the code accordingly.
>     v6:
>     - Remove all definitions (now present in the header).
>     v5:
>     - Add remaining regulators.
>     - Clean up includes.
>     - Address Mark's feedback:
>       - Use dedicated regmap config.
>     RFC v4:
>     - Initialize regulators regmap in the regulators driver.
>     - Register all regulators at once.
>     - Drop regulator IDs.
>     - Add missing '\n' to dev_err_probe message.
>     - Fix includes.
>     - Add ID table.
>     RFC v3:
>     - Do not have a variable for each regulator -- define them all in the
>       pm886_regulators array.
>     - Use new regulators regmap index name.
>     - Use dev_err_probe.
>     RFC v2:
>     - Drop of_compatible and related code.
>     - Drop unused include.
>     - Remove some abstraction: use only one regmap for all regulators and
>       only mention 88PM886 in Kconfig description.
>     - Reword commit message.
> 
>  drivers/regulator/88pm886-regulator.c | 392 ++++++++++++++++++++++++++
>  drivers/regulator/Kconfig             |   6 +
>  drivers/regulator/Makefile            |   1 +
>  3 files changed, 399 insertions(+)
>  create mode 100644 drivers/regulator/88pm886-regulator.c

I'm fine with this set - just waiting for Mark to review.

-- 
Lee Jones [李琼斯]

