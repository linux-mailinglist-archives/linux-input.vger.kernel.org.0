Return-Path: <linux-input+bounces-4332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD590622C
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 04:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26A2282546
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 02:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9DA12BF1B;
	Thu, 13 Jun 2024 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mAcO7s4G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388779C0;
	Thu, 13 Jun 2024 02:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247413; cv=none; b=Fr2F62uwU6NTyAATlrIkqtDvk0CF+1hB4/iEvDHfLzraQ6ta/WRuIjEDbm0u5OnOybumhmTtPuUQBvwDu0cQZ7Wm2tutEpSWDlmzivIotbmGO8o6luVHdEC1lBMtYmD5HyCTECKSOybg3B8u/PVgX8/4fAINToPOdlW0Zz66Ww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247413; c=relaxed/simple;
	bh=v6EHWvK61kiveLsS+vOvVRR1JYgbPNmon5wekWK080M=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IgW/CVh07ZbFT/sHSWDziLB9z30/jfIbiXCn0IRwkpxDkoLl3V16qs7mC8xzAY9oQJKF8aXYhPUOudOeQViV7YWsjamPhkOXy7BnS3h68Svnhd0ayusQ45uSVF0dfrvfjTukEjEh9J8/sidbdnlNMewLVKy//Qan359Ix5GbnSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mAcO7s4G; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718247410; x=1718506610;
	bh=/WF9YMVVkLWBKK5C0uFSZxjSXeVeRPdRrY1i4Gk6e8s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mAcO7s4GJqRKPZfRU7za40B6etNmBxqHs0GSDJQlrXG9LFbjCBIm6X1cZUElmKx+p
	 CjCKqORxTDz3+xb0Oq8zCWINyVIeq+GZoGk/s/lDVAOhtH99uDLrDV6+4ratdijE36
	 yc+zwCqgErcyLErTapoc4lG0JLswsNCPPyctLi04PPjcmtN7Ihn6Hm6JyzmNkYr2E3
	 zOJw87/ktTscHh9TU7j+dU1sBluMzI/YM8dh7YKctCsVocK8/MXj5BGBxQ9h3s8ZQM
	 iY/VNRe1jfLskJYTQMkQMXWrhjBsBfT9oeXkEwe514mPJ0yWF4Q1rfnWwzAXGbisS1
	 GBTidlnPmqKBg==
Date: Thu, 13 Jun 2024 02:56:46 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/3] Add support for Imagis IST3038 and clarify the usage of protocol_b
Message-ID: <20240613025631.5425-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 29b1f6575173bd119d3055ab5b1e3baec68ba92b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 is another variant of Imagis IST3038 IC, which has
a different register interface from IST3038C (possibly firmware defined).

Unlike IST3038C/IST3032C, IST3038 has different registers for commands,
which means IST3038 doesn't use protocol B.
Similar to IST3032C and maybe the other variants, IST3038 has touch keys
support, which provides KEY_APPSELECT and KEY_BACK.

Add support for IST3038 with touch keys.

protocol_b is a property, which tells Imagis panel to use a different
format for coordinates.

IST30XXC series is known for using protocol B, while the other series
aren't. Note this could be confusing, unlike the model name implies.

Adjust the usage of protocol_b to avoid confusion.

---
v2: Sort the compatible enties in alphabetical order.
    Document the binding before using in the driver.


