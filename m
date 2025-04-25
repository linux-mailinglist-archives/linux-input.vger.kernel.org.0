Return-Path: <linux-input+bounces-11996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F71A9BCC4
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 04:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605FB1BA5C08
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 02:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07E615B543;
	Fri, 25 Apr 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFuKctuT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FE156C69;
	Fri, 25 Apr 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547655; cv=none; b=gWsqi+c8o/2fFGWPgCe7F0LHu1bnl3LpjXuMcZI/kVwJuEL2cR177RTn95SkOzqphtQpdR79ZGB387cXyWp5ew7cTX5EMA/E1SQFkNU5GR524LxDvC2HFCBOHzDgUTPtS6VY9JYbpFzk1xLZoa3LmML7wwjKxfCzLyQUcP3rdi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547655; c=relaxed/simple;
	bh=vjhWnE+yweRc5pNFfcwxO1w2ynyuzXYUEPFlulFeJ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flkCuuYkt0+22Y3/WaujFsr2tV9cLYP8Wsgsh7Cakbtxt7GBLW4TeDiCtSWTW1PX6F+SH2LZdfkuw7GSfvfyiDmDS+d3gUtjmmlsna0ULZTNU0r5rdzKj1vO1QUQ7Hc/WtBZqkSorTO/8ECEYAjpQZKJ9aG4y7C6hvzIkB6L9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFuKctuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24A5C4CEEB;
	Fri, 25 Apr 2025 02:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547655;
	bh=vjhWnE+yweRc5pNFfcwxO1w2ynyuzXYUEPFlulFeJ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFuKctuTRC/wLg2WplGSQaP3gn0tPb1bIpva9sc7+v5tf5gi9XbehbR9D9Hyu+NG8
	 3FGiJSvA7lbYEqpCNJJka2LngmB+muAaZwoCxKOmvUH1dGRd7Q0WhDAfbETuwzA91G
	 Rb7zTo3fH+zlvnj6AjFBsZP4kvTppCOQE9jLwhmg4pPYX2BOOP7/F0vISy2SznbRGV
	 YEBq5X/rw1b31LpFU6khV8CEnNagoBDz8apMe4zf6QI20rNXIPM9N4A7l50HlUaL/8
	 1FZS8P9m+pSifbhUT4bt0OvBdLWjaukoFkYLXRlSl+DcXScZPDGk0mVgIgBTAlNBv9
	 9jnG8QCTAVk2A==
Date: Fri, 25 Apr 2025 02:20:50 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: (subset) [PATCH v2 0/8] arm64: mediatek: mt8186-corsola:
 Consolidate and add new devices
Message-ID: <aArxgrBkFvHwr_Gj@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>

On Mon, Apr 21, 2025 at 06:12:38PM +0800, Chen-Yu Tsai wrote:
> This is v2 of my "component probe for Corsola devices" series.
> 
> Changes since v1:
> - Reworded commit message for Elan I2C-HID binding change
> - Dropped I2C address constraint from Elan I2C-HID binding completely
> - Dropped enum from new compatible string entry in Elan I2C-HID binding
> - Picked up Rob's ack on two binding changes
> - Rebased onto next-20250417, resolving conflicts with "spherion
>   component prober" changes
> - Link to v1:
>   https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
      commit: 73d32c3e74e1bd679617b9b9c06d806dedd7c055
[8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
      commit: fb8bfb48a4d11efb9b3e492d7c5e9ae7478786ce

Thanks!

