Return-Path: <linux-input+bounces-14354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62869B386CF
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 17:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C971BA26EE
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 15:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E582D1319;
	Wed, 27 Aug 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0W/RVgT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920F1EDA1B;
	Wed, 27 Aug 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309187; cv=none; b=THUn2SEnhx6LZe3PcSFdroBN1qvuC33EZ+Q1lNGKlrHfE/vGP27fukQ8NrLmXbsA8pzStZKy4nxQye0p4dfu3SH0dogupctFvW35SCbbHq11dTMuu8AoK/2XUDgxWKHPN+QwIZVYmaWkCFaigLc44KBAmePFh90JN2oQAqLoTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309187; c=relaxed/simple;
	bh=CIEqiPViJE9FqRgoWlbwRM4NilSzGfz5IJSUOYLLA98=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K38FvXZA1hR5hDsJLadPfjDgBZ6eoEaF5KxDJTFIZYZdJURM6MI4MyEmQFxZVGv8+6syWyudSs/W7fKhjLdZDqy35/qTA6gJJUTiwQOY47nONDbzEMciVhYYkGjwhZUzd/Tn8oMGDi2vvMv4gWJDUkmIBSy3NcWNAB1PjvJQPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0W/RVgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C79C4CEEB;
	Wed, 27 Aug 2025 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756309187;
	bh=CIEqiPViJE9FqRgoWlbwRM4NilSzGfz5IJSUOYLLA98=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y0W/RVgTSslhllhaMQ+foTpenYKqCEuzfBqOWP0Y9ImSXIFYUstOFQJ8nZr7Ew9l/
	 dV/WApCJD3Y0dvlcwoAbHOrWJctcjx8UWqVkiF0z3w3ZFai6Sp84fvfmb3pZlzGkaP
	 5EI8vbBol1tfHeAeWSoci8GRspSl7/kPPQO2x/fpfyLzYaHtHsBN/apMCHTVaBFZXA
	 GDguD+88zgrCF98IefW1pwIS09ULEcda47j2YpRtbhJp6H6jvVGLP6fzIaaYZq6twl
	 uXf/nTpol+KFi69iKzKvqfcyNzsLX7Yrd+65Vsk61MWtwOGFnig4tPljhefhMuKA7/
	 gucLcXRuLuJsA==
Date: Wed, 27 Aug 2025 17:39:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Doug Anderson <dianders@chromium.org>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Pin-yen Lin <treapking@chromium.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
    Wentao Guan <guanwentao@uniontech.com>, 
    =?ISO-8859-2?Q?Bart=B3omiej_Mary=F1czak?= <marynczakbartlomiej@gmail.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in
 i2c_hid_core_register_panel_follower()
In-Reply-To: <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
Message-ID: <r6q738p1-53o9-273q-0198-327s56qpqn61@xreary.bet>
References: <aK8Au3CgZSTvfEJ6@stanley.mountain> <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Aug 2025, Doug Anderson wrote:

> > Bitwise AND was intended instead of OR.  With the current code the
> > condition is always true.
> >
> > Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on after panel is enabled")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org

This seems to be missing closing bracket :)

> Jiri / Benjamin: if one of you can give this a quick Ack then I'll
> throw it into drm-misc-next with the patch it's fixing.

Acked-by: Jiri Kosina <jkosina@suse.com>

Thanks!

-- 
Jiri Kosina
SUSE Labs


