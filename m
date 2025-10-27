Return-Path: <linux-input+bounces-15732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61DC0CD5F
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 11:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B32C4F367A
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 09:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80622FD67E;
	Mon, 27 Oct 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="LSSge2FT";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="RdN1USwS"
X-Original-To: linux-input@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9E2FCBF3;
	Mon, 27 Oct 2025 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559042; cv=none; b=DpI7ZVsMDpeOLDPld9i4CtEVuWQtQ5BvNTAbN7OcKr+d4ySG87pWl1G2dR/YGck8S7MX8HPR0YiIikRohPB6BoHfhUzV4wRV1Cp82b8zp9XW0WQZuPYcunpyvH1O+inPM1k5KDOktvxqlY+el14aYyaWFfz+q7fIcejohCtfKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559042; c=relaxed/simple;
	bh=thirantOH4kH3f0r2QU+U/UTNUm7Zfvr0Y+urH7YorI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf2qw02qAin8FpbS6hFFbqbPTrvva6ohaEl9PBB0QtQzGKSceZxwq13Lon9i27IN2VJgiaXb3CGelP7vE+vrk1+kVBAEpDskGAPyTnehVqKj0voCimOnyb10GqfT7uvwMgAqVQJN8M8aiR/T1SBMLUDOT3QxhU5kbn9WhQUJ6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=LSSge2FT; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=RdN1USwS; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1761559028; bh=thirantOH4kH3f0r2QU+U/UTNUm7Zfvr0Y+urH7YorI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSSge2FTR6D3qKRjJ42E13VxBPQKSOpHvoA6MooKqxpc9rN2bpRis+EqbJsuKkkIv
	 9zFH+yK4V3WFUphrnp/VTs9J9sdyGd3LKWAH6dhwVR3WB/yyG05vsCupYVUNK+ryrR
	 vJsq25+RrpYP1YB2YjffZscbOox7bmmhkjHpa5/hfXYp4VkkQn1e1NnGaEnlGJoeDQ
	 4CpCX4YhV0k4LnUWtGHZCOWXtiy9hVvhALxvlaLa9AhKSkhXJExQvXUjfGpAY7xMJk
	 UGA67PKFTzk/LmRowxyivmVpO2xjcRFQWY+n/ngdOq5VjOZosnbqv+B1Gu8we4o8eo
	 7wCz1Q9juQkDQ==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 9D9D9FB03;
	Mon, 27 Oct 2025 10:57:08 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOcFvBNfwfNH; Mon, 27 Oct 2025 10:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1761559027; bh=thirantOH4kH3f0r2QU+U/UTNUm7Zfvr0Y+urH7YorI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdN1USwSr30UpaEyXrknx1J/RlMsNcJW1D+1SgQDqvblndSztBpFLTKWwqGDVYfP+
	 6gGRNsWD0+asBilsu/M4X7I4BAAcWHPDKebpmcn00ZniJ5AQQq5MfSeikbMe5wSfTP
	 bxulgTShhIRWA/7A50RBUnXU68pmRzaJbwHsKhw6ZUfkburhzwd2M5zzOBPfYOdg0f
	 e2fQMnpqgzaKyYO7VABXRkKEbGc3H8W0fs5rPdLeLsNH13oatacn6bh/UIfOrOJjHy
	 DlAofM7w6pCwgcFaKCONz4UHRxVKqbiRRN+R1Xum1hR6MwNtY2YeipAMUQMPG2dwAk
	 UY2IbbSFcXSkQ==
Date: Mon, 27 Oct 2025 10:57:05 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>, Casey Connolly <casey@connolly.tech>
Subject: Re: [PATCH v7 0/3] Add support for sound profile switching and
 leverage for OnePlus slider
Message-ID: <aP9B8fPs7y2-dGJi@quark2.heme.sigxcpu.org>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>

Hi,
On Tue, Oct 14, 2025 at 11:20:32AM +0200, David Heidelberg via B4 Relay wrote:
> This series add initial support for OnePlus 6 and 6T, but other OnePlus
> phones contains same mechanism to switch sound profiles.
> 
> This code was tested for two years within the downstream Snapdragon 845 tree.
> It is now perfectly integrated with feedbackd in the Phosh environment.
> 
> The series is also available (until merged) at
>   git@gitlab.com:dhxx/linux.git b4/op6-tri-state
> 
> Changes in v7:
> - Separated GPIO number fix from the original commit
>   "arm64: dts: qcom: sdm845-oneplus: Add alert-slider"
> - Rebased again next-20251008
> - Link to v6: https://lore.kernel.org/r/20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz
> 
> Changes in v6:
> - Rebased again next-20250731, otherwise just a resent.
> - Link to v5: https://lore.kernel.org/r/20250419-op6-tri-state-v5-0-443127078517@ixit.cz
> 
> Changes in v5:
> - Dropped merged
>   "Input: gpio-keys - add support for linux,input-value DTS property"
> - Link to v4: https://lore.kernel.org/all/cover.1677022414.git.soyer@irl.hu/
> 
> Changes in v4:
> - DTS: use default debounce-interval, order alphabetically
> - Link to v3: https://lore.kernel.org/lkml/cover.1676850819.git.soyer@irl.hu/
> 
> Changes in v3:
> - rename tri-state-key to alert-slider, fix DTS warnings,
> 
> Changes in v2:
> - rebase to qcom/for-next
> add SND_PROFILE_* identifiers to input-event-codes.h
> 
> ---
> Gergo Koteles (3):
>       Input: add ABS_SND_PROFILE
>       arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
>       arm64: dts: qcom: sdm845-oneplus: Add alert-slider

feedbackd has support for this since 0.5.0 so it would be nice to see
that mainlined.

Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
Reviewed-by: Guido Günther <agx@sigxcpu.org> 

Cheers,
 -- Guido

> 
>  Documentation/input/event-codes.rst                |  6 ++++
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 39 ++++++++++++++++++++--
>  drivers/hid/hid-debug.c                            |  1 +
>  include/uapi/linux/input-event-codes.h             |  9 +++++
>  4 files changed, 53 insertions(+), 2 deletions(-)
> ---
> base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
> change-id: 20250419-op6-tri-state-ed1a05a11125
> 
> Best regards,
> -- 
> David Heidelberg <david@ixit.cz>
> 
> 

