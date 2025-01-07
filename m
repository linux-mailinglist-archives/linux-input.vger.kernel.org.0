Return-Path: <linux-input+bounces-9006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298BA04A29
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A34316263E
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFA61F4E50;
	Tue,  7 Jan 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCCXosVs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1377B2C187;
	Tue,  7 Jan 2025 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278064; cv=none; b=aIFGKrY4xHdmgs5AYjI7o8Jqc9KAN78D8e9NI0CA+4hhg5496u/Y6js0tUqRbpirAqxb4zANEnweK4McI0MHHUdAk+MmbZW9/XEkJjr11t8+9Ld62kNGpcQ1iCT78cXYO91q8I2NlnxpHOMfx2HLTI+5Om6cICrzTMXDDNVHLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278064; c=relaxed/simple;
	bh=zqOtHrxY0jU7PIOkANGe7Vv7pTtSefbvcRxSxpWlslw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeY5zkhdhcOe5GHMs66/eWHbCeeFgziOAp2C6RfeQb23LXmtqRN+rrHorrtiUb3Y2L7rOiVoD7Bff78SC/aD1TnVw3cEg/LHane4iGT72tSX0iocQHY48pWTo+HdbBFVqoikPChcQ9H8zQ2GDGb1CabByZK1kMK+46mmjBI0Rng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCCXosVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8443EC4CED6;
	Tue,  7 Jan 2025 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736278063;
	bh=zqOtHrxY0jU7PIOkANGe7Vv7pTtSefbvcRxSxpWlslw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCCXosVsZfeqEUJsjCLq+oAZAQP04QOrmNNvwjumuBInncFukq3xp8+z4v9GrT1lQ
	 KcA0X9IYcA4J0g3FqIP6OBikkjYusKhDftOuPFf8vrBLpZNMHLyp0XZx7bqFkBLgVa
	 j8qwJc5wR2lY38bWocbnrISZZQow+cZdnPc83jI0YXb9+eAei8oQ/0JIL3VpyeY4sV
	 PvdLuzMaM8gIquvsywQFkj/HcTB+vv6Z8NS2q76K5mkRxBDsfRkbCNhUuGtM4oqg+N
	 mHQdwGAdJHgdV5K8+Cn8IX2nweWXrWu9numGa6ZGu1O3i/l6c4wh8+YACJlbjpmtuB
	 3qxt4DOl7KV5g==
Date: Tue, 7 Jan 2025 13:27:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: input: matrix_keypad - add settle
 time after enable all columns
Message-ID: <173627806210.1349671.3743592193426353815.robh@kernel.org>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-6-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107135659.185293-6-markus.burri@mt.com>


On Tue, 07 Jan 2025 14:56:57 +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable
> all columns.
> Add optional property to specify the settle time
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


