Return-Path: <linux-input+bounces-13440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A2AFEDBA
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 17:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A39EC7AF79F
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 15:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8FE2E54DF;
	Wed,  9 Jul 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tfM/00Q/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E05290DBB
	for <linux-input@vger.kernel.org>; Wed,  9 Jul 2025 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074603; cv=none; b=WqGbsg9qTOYcDT0X6rHUaNh2nrrTY9Fm0uQKG64h9cTkgje/QNHt1TOPGIXLDYfD+tqihikPDybNMA/OvKj2j7Oj4Pd6XPwzSzO4TIVrIXTHFCTekS1FLQoKXvseAw2xlfRVQmIDk3qcA2yeddxEvWzlLnR3AtCWiRs6uVu+vMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074603; c=relaxed/simple;
	bh=xNwWPqmfXox92HseMYI7HIS/IbNrVt1B74JGLKAC26I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kR3fO1NoXiGsClvf+TnlkSta0raZ+MVVsgxSjHkzLlomhRRB9jkNrMAxL0652WZnSOHBWhqC+IAA+UnKQSVIs+c+Gl2QkaOvpVw5vP2Hz6WkATHpKMRfAUnWLXt1xORS3OoA1sD2iTwuS+Zey8l8SuaZlzZxgvaZeAH0iZsx8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tfM/00Q/; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d20f79a00dso824785985a.0
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752074601; x=1752679401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=taKscuAxBARZZVcojDiir7HwGviwhLXve6yI29pYzq4=;
        b=tfM/00Q/tJZssHdpFGe4w/pocrFNZCY55Kg4ExwytRN+Erx21XF4V15vIqVJbAL5Xs
         P4k9lxxYlJn5lvRwIxqKdgNKF2lFs8IWW2Mg3LMo9/iLNTNGxegDpHmmQ9cKSOLW1wYd
         eLK4vpXxwSd6M2y5nFP5Ui7gBbj745vovHy4bu5pYvv+yYPD+UM/VtLUu7FAaf/OXKLy
         xMGh/amc/AKpQyALk+QHLYMOjN/agHxPI1u2cHXIgNghFogGQTxPfdLKp5yX8dFXZ2Ps
         U2bQqN27LxaebdF3j5sBl9H6jFEs6V9kyiyjjqCnZJhj6W45MWOsOwZxXggNxPxHEAhY
         gGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074601; x=1752679401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taKscuAxBARZZVcojDiir7HwGviwhLXve6yI29pYzq4=;
        b=JEPlrGN/y/wq2cCFADsPr+7Y58+pJrE/LwoheECwHjVF0VJtZ/ulXZ0xdObgyDgCfw
         yr216kCgg6MA7TlwnnVbJ5saT2mNa2ljBw1tZNESx4+suVdxTHAVQKhqjb7bls5GZDgE
         xD2z065BH5IJLkpGl9vUi8aYvevi2Bvn/+rMe1qhc6JlvZgReMToaX4ffrWWhj1SLMkw
         E+AyHtlhCQG0drhIG44iyBmrlfulDfRzyeGjKzvip74/MHhQCfS7E/TUkpYlSDjDs6iu
         lPh6hPmx/Hb09w/WM+8l97MvBWpKftB2x60zWMaaKWF/W6ztKMVJUDHOQLzLdDg1f/gD
         CRBA==
X-Forwarded-Encrypted: i=1; AJvYcCVwPZdvKTf9AKOkQw0IzKrp9u+DmFkhrChcBLytemdsXeak01OnD70fM84tLSM88h/acnsWVfTGnzTKMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2X+LpmOrZCM/gcLqIib6kb6VLtG+IDdLdz+MN66pc2t3dDgUV
	X+9JeUPT2u2pydOMeK1a5mZrdMgz+VPhFp2ko7OeLJHfo97ZqMuEGOSHckuP4v8s8w==
X-Gm-Gg: ASbGncsnvfdRBk4Wcs5aQvVHQgk544EGBXo5u1cPdwKyadbWcrfqWBsglktsXJ/WVk2
	0Z7GvsNRRNRTfy97wiZGY4/+q3udrTF0oZfTUEqSLH7X5TsCcIxMmf1n1xBigtEeLWaNJc7PsmH
	5PMHK/HguvcNBLag1dl9vhHcaZqNDRa7qsQhWyQAVBEht08U3o3H1U8aozV05d5QoNNs/GPP7FC
	E/0aRuUtDImfQv9FjwbfBisnbajs+b+STpQZat3fM+yim1hsBYtGTBQ3sTr1OuztoAoJZFDnlpO
	NUrsEWskfdYYwlVfdawMwXt6Q0SQeiezS5wjDjAqurbxCftjNz4oz4YkMKQKLunKTgUlSTl2lFw
	P6JQKkRgLs027J6c=
X-Google-Smtp-Source: AGHT+IFbarZZxnuGdEIcNxHTdtx9ncDHcHXXZLfwwDFk0c7S4XwskR5r0Tcfdvp0h6o4S0UIJPdXug==
X-Received: by 2002:a05:6214:5981:b0:6ff:16da:ae22 with SMTP id 6a1803df08f44-70494e94cd8mr5492326d6.17.1752074601088;
        Wed, 09 Jul 2025 08:23:21 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ac6dsm92634596d6.96.2025.07.09.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:23:20 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:23:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] HID: core: do not bypass hid_hw_raw_request
Message-ID: <dfaf82da-c389-4758-ac2c-102fc418ed41@rowland.harvard.edu>
References: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
 <20250709-report-size-null-v1-3-194912215cbc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-report-size-null-v1-3-194912215cbc@kernel.org>

On Wed, Jul 09, 2025 at 04:51:48PM +0200, Benjamin Tissoires wrote:
> hid_hw_raw_request() is actually useful to ensure the provided buffer
> and length are valid. Directly calling in the low level transport driver
> function bypassed those checks and allowed invalid paramto be used.

Don't worry too much about the sanity checks.  If they had been in 
place, we wouldn't have learned about the bugs in __hid_request()!

Alan Stern

