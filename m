Return-Path: <linux-input+bounces-14959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42852B8F24F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECCAC3A929D
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 06:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DFA254AFF;
	Mon, 22 Sep 2025 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0JKCLHd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AF21D596
	for <linux-input@vger.kernel.org>; Mon, 22 Sep 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522628; cv=none; b=bOuE7Flj6WyiGG4gaciaS4YxfLjPmBI7nsbgM1MHHwhF7UFJ6ej07DSdZEC7Pqdmnks+pbzETRJvZghkh/yVLrGO4ETk1G+N4CAVuzP5NCz4oXxXLy/VrxTRmI5g6m+4ctTfNJIoZt5tuNIc3mvCD5eK1hHVuPLNMa1g3GnNGsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522628; c=relaxed/simple;
	bh=LNhTlnBiDZt2lVpQ7PMmnZIkpHHdCtz2DcozfcDgh9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hW/IIhEDz6EjgVVP7vNV/EBp6Co0WH0BRMt37BPQZZbv1HixJLEieah46+D/sjLvFavS5HSQn2Svzcm5lvyl4ClTqeeR2nLbXV5JoDEH1skipK8ltKXbfwLJrgcRASnx+mHWQhiEq0dgJ2i6EKSMa5P7qIQ4TSnwI/WmOC1eDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0JKCLHd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f3580ab80so756092b3a.2
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522626; x=1759127426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWPs0O+PpJeDxSEciw3RIzwQywDcizw1sWF+i7zbwU0=;
        b=N0JKCLHdSknj/V96nEbrltNDlqeIMmWO8zMEL+4WHow3wsh1lQ5Hevzt0aMOc+sq7D
         Hrhj8fjmgJoPK89o6qshbSuYn4PPItSXXzK6g2/yfYX1Sx3SBReu56tpiAyWjp4xdQj9
         1XQK5smuWuGTwY1OqiGgYcorRAU/QUuC/3vBYNjkX2WpHvFJRozVi83uB6mU+yyRG/OM
         lli9XvTEv89VKoHJaHUbHStyLVQnN3NxbnsyicFGE+PMk5ma0nChFioJgB+SHb+0IUj2
         uohGQlfHIyZCV633ERjcD6dGPu9baKvRV+ly5mJ5w9Mhts3uGYLRTGz8VY5MPU8On+Cn
         4yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522626; x=1759127426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWPs0O+PpJeDxSEciw3RIzwQywDcizw1sWF+i7zbwU0=;
        b=fdaPzkOBMlP3MMu2hnWSXTREHm1yrKM0AdfFQ2iDAkkx8OhB1pE2a0tNlK94S78RHz
         X2zLu+SGVd3ms/dv6oQ0PYo8Sg+TBTSl0KFNNiMy+dIyt8S/55Gn7fTxNMFRbuHVdMuQ
         driX8VJ3BzEVttuI7Ftt2SoUVctLYJr5K0MrlvOBMuVt8296M8CKBmtIySvnmxeM18hR
         Jjku9SnwB/sL1DQRK/n/hvg8x+V1mNb8ugrTz5OfNYiyPP7uRTT2Kg2DyVyIhXC0g7gm
         +yCGo/H1K4Swz4T6wgbyBwpsHn3J6sXRx9JxemMskWXwQvXjuhX9UeH/YqNPHtyhJyph
         prlA==
X-Forwarded-Encrypted: i=1; AJvYcCWB0brQ4kcfiw5HxxnGCJFlLq2wYBHryj9mGQZVKDI3WSgk2MlMpCjyzcRBtWRDFEhSerLXRZaqLESjhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZkpc8a7QvnflBNSrIRyeO7SLtmknNsRzDq8r87Rr4N58QMjD
	fDM7rinrGAZJ2fzEAnAHaGvyFC46L6GTobd0FMnljoT1RE6ZfYIqG9+2
X-Gm-Gg: ASbGncsr0sLet1J6wU6APQkhY3rfC+cj83Zyb7sy/BuslhNeY+FPC5OBaHKoajARawR
	Q+I9ePD2CbxtS7TirdosNsuRyTOzwB5MP0UZvgWwqaV7Iibn1+ZqpE6l1xTZkz7BT0gaVUmsaNb
	85Lv+uvqsNKo01DA0XJ6Lbgiei2kxrytyjhD7D0Lb+pA1Y45zdF2sNBgO5w2vBVLbd2nTpmy6HD
	aD/MmGhu2DtrxSm/2VbxbLET9HinknXao2AeZefxIIPfYeNIEIB0hzP+FZvO/sMZkBgEm7R1ehg
	hoTfYqA883cINmu2ZjHmWDoGCTWaR1qLr5zypave71VQFIK9+B2af4ihqi7PAUxKqCy5/kn/YDC
	ruS+khn4PRejdKV6fNEujWmE=
X-Google-Smtp-Source: AGHT+IHCr80+p0HUXpiN0kUWu6aXyizO6B94WEmeGsdFME4p+j/Pv5y4cgnsVE/m2JUndDzORffBIw==
X-Received: by 2002:a05:6a00:3c91:b0:772:59d2:3a49 with SMTP id d2e1a72fcca58-77e4d31f18emr14939602b3a.13.1758522626022;
        Sun, 21 Sep 2025 23:30:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e948:4db8:6798:ed8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2d414457sm3324170b3a.30.2025.09.21.23.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:30:25 -0700 (PDT)
Date: Sun, 21 Sep 2025 23:30:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Casey Connolly <casey.connolly@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 0/7] Input: synaptics-rmi4 - add quirks for
 third party touchscreen controllers
Message-ID: <5gcq5xsurdp24o7wndo2fm7pjsc3khco52ji34jjmeet2nidl4@rkbh4a2c4d3q>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
 <aggtzmlxvj4so6t7trlo5ianjcbq2jrsodv6hlkhtrvgl2qpqj@gflvqocxjckb>
 <b223a48e-952c-4825-bf82-e8922434e3c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b223a48e-952c-4825-bf82-e8922434e3c1@ixit.cz>

Hi David,

On Tue, Sep 16, 2025 at 11:29:45AM +0200, David Heidelberg wrote:
> On 07/08/2025 06:29, Dmitry Torokhov wrote:
> > Hi David,
> > 
> > On Thu, Jul 31, 2025 at 11:06:50PM +0200, David Heidelberg via B4 Relay wrote:
> > > With the growing popularity of running upstream Linux on mobile devices,
> > > we're beginning to run into more and more edgecases. The OnePlus 6 is a
> > > fairly well supported 2018 era smartphone, selling over a million units
> > > in it's first 22 days. With this level of popularity, it's almost
> > > inevitable that we get third party replacement displays, and as a
> > > result, replacement touchscreen controllers.
> > > 
> > > The OnePlus 6 shipped with an extremely usecase specific touchscreen
> > > driver, it implemented only the bare minimum parts of the highly generic
> > > rmi4 protocol, instead hardcoding most of the register addresses.
> > > 
> > > As a result, the third party touchscreen controllers that are often
> > > found in replacement screens, implement only the registers that the
> > > downstream driver reads from. They additionally have other restrictions
> > > such as heavy penalties on unaligned reads.
> > > 
> > > This series attempts to implement the necessary workaround to support
> > > some of these chips with the rmi4 driver. Although it's worth noting
> > > that at the time of writing there are other unofficial controllers in
> > > the wild that don't work even with these patches.
> > > 
> > > We have been shipping these patches in postmarketOS for the last several
> > > years, and they are known to not cause any regressions on the OnePlus
> > > 6/6T (with the official Synaptics controller), however I don't own any
> > > other rmi4 hardware to further validate this.
> > 
> > Sorry for not handling the patches in the last few submissions. I am
> > planning on addressing them once merge window opens.
> 
> Hello Dmitry, kind reminder about the patch series as the window is open.

I was looking at the patch series again and with the exception of patch
#5 they make little sense for sensors other than ones used in OnePlus 6.

I wonder if we could key it off of something, maybe a distinct
compatible or a property? Rob, Krzysztof, any suggestions on how to deal
with devices that do not properly implement the protocol for which they
claim compatible?

Thanks.

-- 
Dmitry

