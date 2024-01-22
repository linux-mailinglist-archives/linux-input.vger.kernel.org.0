Return-Path: <linux-input+bounces-1393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A344837246
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 20:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B4629340D
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 19:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C1D3DBA4;
	Mon, 22 Jan 2024 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5Uu5O9v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F63DB93;
	Mon, 22 Jan 2024 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705950831; cv=none; b=nboSwwbgtXshz26uPZGa+TPvdXY1pHKmEhNDWL/Qv494YKQe7TlM5O7Met15CAdzZOFfS9e1W2bGeScIc4nBv1mFV2e953tLF05hvWrkrDhu5ycowIy5NEyNu1MzwKsJVTJvjhb7GPsFpD1gwSgtkRoDysyUnbZ8kPI9s1W8yYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705950831; c=relaxed/simple;
	bh=UtPW3iBOYj9y1r3lOHYj8pC4RC8774OVmpdKwb1MVLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/TZxOgI5l+OO+NXq3zLoXWhn8dLmftQ4lmazykycB/AOKfSHvjdarB6Jra3+I2NTsmXyAC5xBA8vQbQt7/vKfIeI4QCj/3ZrwOMtsS3337Y1D90AlTvoBlYowQZxVlUhK9FNgYN1TOBO/BD4M7zeEMrdFEIZte99JKJPOKPjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5Uu5O9v; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d9b13fe9e9so2816250b3a.2;
        Mon, 22 Jan 2024 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705950829; x=1706555629; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+zs49Ss16lx07/2W0vLfClzzZfLGVFixdKySGjV38uo=;
        b=c5Uu5O9vWUfG7NHeLFLUEW1SPMHM2fnsXBDPknI/gz88mNHxC92YDRgaIohGsw2MPf
         qAyspKQhxhnQrcIVV66IBa+SYmKHfDJcsHh2+tpplIXwF+wJeVEdGynYBo+q2KZltrd3
         zIFMM38GoyFdjgjBco3aiJr7+eDm6A3cSVQ3YBrnDQvEnrumJIwECyADtxjW/vAsEArE
         StOu7/JcbPT/YW72ZvlAMfJrccAqOLhpsbiDq+zJfmdzo9Aa57uObsCZyR+oGyUL6d5r
         m1xhQdpMAR82eI0q7JC7wY3xwjCMI8VkVaEEp0hTmKJcmfo1nsIggwcREfyhI2W5cKcs
         W9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705950829; x=1706555629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zs49Ss16lx07/2W0vLfClzzZfLGVFixdKySGjV38uo=;
        b=vixmSg4a7CbHHzVblTg9+KwN+BXGdANWa+t3yDa1j/cQJu8KGJ2RtiUGjPIJe2NEXf
         ReJtUUUw3Wm5mEzU8OKeAXq1n6JBSHtKj1gM5biWcbetdPpKbIa38I+sr6fmKmLhZ0pc
         4mN5TSxABhdS60tDuAU1CoI1HeeIFXnfpzu8AG+bZ+ske/85EfoZWXwEO9RN4+k0C7KQ
         8H3xmoCBwG0yRltTPXJJIsRND7gDtKzt6H88qfDss8T3XXXBrmhoUtfQUhgpk5xzMNPv
         ssjBow0tgRf8CkTFT4VF0hhWaoNxfaNGbHW2n63E4pn34UAwwZtCZPOJAGVckpnHGo3n
         fFxw==
X-Gm-Message-State: AOJu0YxR7XmYkLBjbh+o3Nf/qsIzL7LbuAbpN/9IXTfm29vklGEPX400
	3Rd1Wcp2As6zndJyIIM0E4b41Hec2ipkrWAc7eU/bVoDZXGwOkMM5qUhX5uF
X-Google-Smtp-Source: AGHT+IHolkkL4zh2a73ERbn2UVlqONUvn274CRcjTuUOGhHqdHwE0WKxjR4YcgpMT+ylafWbWVrp4w==
X-Received: by 2002:a05:6a20:4709:b0:19a:25c6:4913 with SMTP id ek9-20020a056a20470900b0019a25c64913mr4706873pzb.38.1705950829039;
        Mon, 22 Jan 2024 11:13:49 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b644:a8c4:640a:70c6])
        by smtp.gmail.com with ESMTPSA id i10-20020a65484a000000b005b458aa0541sm7472918pgs.15.2024.01.22.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:13:48 -0800 (PST)
Date: Mon, 22 Jan 2024 11:13:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input - 88pm80x_onkey: add SPDX and drop GPL boilerplate
Message-ID: <Za6-asdWrxuxbbXs@google.com>
References: <20240121-88pm80x-onkey-spdx-v1-1-b646d4749f5b@skole.hr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240121-88pm80x-onkey-spdx-v1-1-b646d4749f5b@skole.hr>

On Sun, Jan 21, 2024 at 10:11:00PM +0100, Duje Mihanović wrote:
> Add a SPDX-License-Identifier to the 88PM80x onkey driver and drop the
> GPL boilerplate in accordance with current kernel code guidelines.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Applied, thank you.

-- 
Dmitry

