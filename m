Return-Path: <linux-input+bounces-7748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD479B39ED
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 20:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F4003282D38
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 19:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C71E1DE8AE;
	Mon, 28 Oct 2024 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE5+G3k1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C318DF77;
	Mon, 28 Oct 2024 19:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142283; cv=none; b=KFgJfaemVOn7nBpRsZNIh7QFt9mKw3uPmPmtghSotwMFISjsDCKWpFyESOwo8EO1YW/khLf5RM/7PtUNli5MF00uwRFhnnawailT0IB6m2MGGv03YooWI6O7kL6v/fmQ5W842BwlOOWy+0nFnEV1khXxwCigkP/LrryHOIwPwn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142283; c=relaxed/simple;
	bh=xepM4h6v+VJ8U3pRtpoMyZ9VuGKEwo7ELCQCMO5p/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSAmKhCwWbrGMWfuu3M0PLcbQmI4cmEeZCqYG9VPQaPXPFbRvXOjI0ypap3GrLkNlSZIvFYc0C6U7B85cc1vw04ueFwr/ZcvXHS4n1XJfGdEA5a2Z0r2z/HD72Ds8hsfaTWNDLVeixeYnKgiGVqRnBwlkWRnySDf8WXL96v8mBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE5+G3k1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e7086c231so3550570b3a.0;
        Mon, 28 Oct 2024 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142279; x=1730747079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+BcJmJv3LS4q7Hv3Kc5Q5meZeEkT9QtVp8QKpoSCfE=;
        b=BE5+G3k1CvKo67jHBjstZz7CdUlUWgp7t5psHGgkFuaKvXHmyYx3mTphST1gPHf3qt
         W8drxqxbzZ5JQaW7dCb7WdO3DG6FDRBJxhEB9+jOK/wEGC7vJZeXGoiJivilct/O+1lQ
         uNd1mtkm+5u2PpfoFpkhjrT324UMjRD0B1sNpq9nEaJYT+zuHOxqISlNirh0m25e9wmr
         tAWRDakvAH3pCPHcLze6qyKyaSjTrR3EtANNpvd6bW6QvRzC4z7J8YNpjyyofnxz/3TC
         imHBOIE9TzG5AyA3O+Tjktbtle8E1AX5m3OWa/y7BZ1vQbz7Xdq9l2yLtz3Nj0Hc5xEt
         aB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142279; x=1730747079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+BcJmJv3LS4q7Hv3Kc5Q5meZeEkT9QtVp8QKpoSCfE=;
        b=sKKNL0VX5pAiQ4q5GHlhWsLG85JX46fO5rZo9QQFLsKMMSPkzpAsejIfW9C04e3RNU
         HWA/M7FN/DZ1EMEFO/w9PcLOjpY5105FRzwOqgfaGM32zw9Q/tuJD9Nsy36Gzpz59m/1
         BmusNqE8J1vkO4YfO/VKc9XTwoyUFqmX92Had9y55oTNQAok+1SShVMY98B15S5nvsMa
         bzyRPi2LKkqdQ1FFjb5xr1Jx7TODkjxJdbBgW/2LRIyerrM2tKoEK05czC9h2Z/+mBkl
         Qauf1pVMu6zgX6/f9gd8y0BeT+0aibOfaVdOdNzBC+3lKOViGyfJxZ90G7BVboHfYZ95
         ntnA==
X-Forwarded-Encrypted: i=1; AJvYcCVHTKr/aCvdcfGu+n3WTqvi0I4CCa0OAags1AzYZ5KbYdw6NE3QTaR/hC8nQHSSlehVTHdZNsHXDEzrVg==@vger.kernel.org, AJvYcCWZevIAKBILloNKKYRznrBQQFz6o2EMu+rv+3WWMBHcnm01S4ZXOfNaAuoFKe8MSO/k0moCYnR/FKqXMA2R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+OgFawxbMRE+5LA8UjpUN+XR/ENMX9FK/kd87OycqsFLgq1Zv
	UByweY1lRK8fyUjt1516TmYRkTAPG9+sLaBLCd3NRK3k+fLQl0dx
X-Google-Smtp-Source: AGHT+IG4/Ohig9L4xymEiQUtTcPMn/wy56S6YyWnffb+ZvYM47tKR0e/TkOTtma8c1OpHKYyDKnwmA==
X-Received: by 2002:a05:6a00:2d95:b0:71e:617:63c1 with SMTP id d2e1a72fcca58-7206309805amr13918690b3a.27.1730142279135;
        Mon, 28 Oct 2024 12:04:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e9ba:17cc:78fe:499e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a24199sm6291059b3a.178.2024.10.28.12.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:38 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:04:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: make mt_set_mode() less cryptic
Message-ID: <Zx_gRK9siGDtJ3PN@google.com>
References: <ZxwciG6YeVFgfDRU@google.com>
 <nqj6hx3yhw3q5e5qtyqdxwpxt2xe3u45vibjcjqmpmsvs7opq3@snxzjynjpwyp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nqj6hx3yhw3q5e5qtyqdxwpxt2xe3u45vibjcjqmpmsvs7opq3@snxzjynjpwyp>

On Mon, Oct 28, 2024 at 04:47:55PM +0100, Benjamin Tissoires wrote:
> On Oct 25 2024, Dmitry Torokhov wrote:
> > mt_set_mode() accepts 2 boolean switches indicating whether the device
> > (if it follows Windows Precision Touchpad specification) should report
> > hardware buttons and/or surface contacts. For a casual reader it is
> > completely not clear, as they look at the call site, which exact mode
> > is being requested.
> > 
> > Define report_mode enum and change mt_set_mode() to accept is as
> > an argument instead. This allows to write:
> > 
> > 	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
> > 
> > or
> > 
> > 	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_BUTTONS);
> > 
> > which makes intent much more clear.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/hid-multitouch.c | 29 +++++++++++++++++------------
> >  1 file changed, 17 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 99812c0f830b..e4bb2fb5596d 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -83,6 +83,13 @@ enum latency_mode {
> >  	HID_LATENCY_HIGH = 1,
> >  };
> >  
> > +enum report_mode {
> > +	TOUCHPAD_REPORT_NONE = 0,
> > +	TOUCHPAD_REPORT_BUTTONS = 1,
> > +	TOUCHPAD_REPORT_CONTACTS = 2,
> 
> Maybe to be more obvious, BIT(0) and BIT(1) for the 2 values above?
> 
> I'm just concerned that someone adds "3" if we ever need to add a new
> value.

Right, I'll change it.

> 
> > +	TOUCHPAD_REPORT_ALL = TOUCHPAD_REPORT_BUTTONS | TOUCHPAD_REPORT_CONTACTS,
> > +};
> > +
> >  #define MT_IO_FLAGS_RUNNING		0
> >  #define MT_IO_FLAGS_ACTIVE_SLOTS	1
> >  #define MT_IO_FLAGS_PENDING_SLOTS	2
> > @@ -1486,8 +1493,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
> >  				     struct hid_field *field,
> >  				     struct hid_usage *usage,
> >  				     enum latency_mode latency,
> > -				     bool surface_switch,
> > -				     bool button_switch,
> > +				     enum report_mode report_mode,
> >  				     bool *inputmode_found)
> >  {
> >  	struct mt_device *td = hid_get_drvdata(hdev);
> > @@ -1542,11 +1548,11 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
> >  		return true;
> >  
> >  	case HID_DG_SURFACESWITCH:
> > -		field->value[index] = surface_switch;
> > +		field->value[index] = report_mode & TOUCHPAD_REPORT_CONTACTS;
> 
> Just to be on the safe side:
> !!(report_mode & TOUCHPAD_REPORT_CONTACTS);

Oh, yes, that makes sense. I'll send an updated patch in a minute.

Thanks.

-- 
Dmitry

