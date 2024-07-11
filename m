Return-Path: <linux-input+bounces-4976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33C92ED9C
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 073581F21306
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCFC16DC0E;
	Thu, 11 Jul 2024 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPhufKhj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0238D512;
	Thu, 11 Jul 2024 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718297; cv=none; b=BseypYeoSiYGAqhcn1xVOVozeENcvkK1eGDqIVA/pLw24+X0JdI9rdanYJfQJXyXdKyvXMklHBBA7r1Mj26QzX5BkrjIm3S0k25Grg7lBUNi2TEAU+6ymTtzHiXXRLs+WOsfLfEiPiVmp36hIo+mFPNH2RrTcpoEkiq44VHf0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718297; c=relaxed/simple;
	bh=2KPwA0YgHJPBApB0LAdHxCOl16/1G1yHfY7JRbOp7VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SptZLMQ9krllviaOvFiTPBlYe3RSCkvmQNSTN017AH74oluHPrv1OCZdWzx3ciYoL8KIugJezFko4pH4jhyf/7Y2TfMUzGTG7J6sZc7CAL5Ou7Sr+pLfCwc4/6jwWbfXQDrUp0YKFTf/EC2Kvt/w72lI+gHZGsEcpgls666X180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPhufKhj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7669d62b5bfso771762a12.1;
        Thu, 11 Jul 2024 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718295; x=1721323095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tYmzgqsSkkD0Gz50701/4Z6SMa5XZZYUoWansf9Hxzg=;
        b=HPhufKhjF8xqRK8Pe2Or902g1uGMBpsDmHUyCzxi+uc6nDoblmbEtuYvuoUKMdmdpt
         +/lcB1FB2XoVdXLBldZS/zunT7E4vrOGq5yJ8m+tk79r+pIyoKnQwym//jD5M8dDEIXB
         ZElRx/hegCNOJMsIXI9AB5sthfmVhYzUV3ZmjhNS8BuQucjw0q719+ydHNZWG8GWMR47
         GDQCbcDkCuneL2/6pAVrhZqau/F6GFxE3NdnlY/AjjZ3lHUFOkuo9so1y0JUp8j/5xFX
         G1Ld90NMVfROasHro9bYeuMFF+FxyTZESOsR4+l1Jg43Zr16aFgudfGPJRDKAp8qYlh5
         qRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718295; x=1721323095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYmzgqsSkkD0Gz50701/4Z6SMa5XZZYUoWansf9Hxzg=;
        b=EXFAzDF1O3Ccl2OUvsrumEWa72VXxBB7Raou6jMFX0km7pEeI71IkIr8m0IGGDm8Gd
         CyATrsa2zLebtZAR9IAtpDsnp5bZXdUNgPnbe6qf/8hYe0afIkDgELP+aXgKycinqP6I
         UTS9F7rt097dZwIa/dSUFYRKHY+lB/W8zLZuFFXV7ZUcg3ZQlBF89TLR4kNcxdww82uS
         Dd7KCDrPR69Ft0HVnEBuh3MCXH3wMEsNni8HqWWmzunfBFdAdkey9mHZ0SbTPR/4ZUuZ
         aqsWEdli2EBOgf77YISRnwGVpKetxbOiOmQN9dIALcer1O+zGW0NKq4So4dIAZbp5Z14
         ai7A==
X-Forwarded-Encrypted: i=1; AJvYcCVFBs6Cq7WGLp3lP5LNqOkFdBhg7BhgkH9ytkRbQsMgDZWX+HzBlG9OdhIyrRZ4GWKO8HGkACQo+jjMqsJb0tS4wsd5qSq4AukJwziuCt0neEhDyvfvVUCnx6rrBlw3Y/Eye+dh+5rV2mwJ6lgr5z1iL5QM7J/J5lhYfaVSDRUDmFHOIKHC
X-Gm-Message-State: AOJu0YwwjTQWxNxmbGtIhRYc3GnhVjoGqA2wKd/BLaI6BklfXgO7DauY
	L3msnnEgQEhDcWMpYNQojjy1GFqiysSls2ImVwOFQZt8iCu8NBbu
X-Google-Smtp-Source: AGHT+IHobCwPAmLnXNHYHhGfAxZHsdEZd1CJJ7Sexcs7TnxufAkOrvXDNpfYYX+e4fxgoQm7f5Njiw==
X-Received: by 2002:a05:6a21:e8b:b0:1c3:a9b8:a9bf with SMTP id adf61e73a8af0-1c3a9b8b006mr4808186637.51.1720718294820;
        Thu, 11 Jul 2024 10:18:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43899614sm6148863b3a.17.2024.07.11.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:18:14 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:18:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastian Hecht <hechtb@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v10 2/4] Input: touch-overlay - Add touchscreen overlay
 handling
Message-ID: <ZpAT01jr9rS55t_B@google.com>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
 <20240626-feature-ts_virtobj_patch-v10-2-873ad79bb2c9@wolfvision.net>
 <Zox_cVYsErrLu4Mq@google.com>
 <d8734538-81f4-4883-bd29-2f8b682c3d1c@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8734538-81f4-4883-bd29-2f8b682c3d1c@wolfvision.net>

On Wed, Jul 10, 2024 at 02:16:13PM +0200, Javier Carrasco wrote:
> On 09/07/2024 02:08, Dmitry Torokhov wrote:
> > Hi Javier,
> > 
> > On Wed, Jun 26, 2024 at 11:56:14AM +0200, Javier Carrasco wrote:
> >> Some touch devices provide mechanical overlays with different objects
> >> like buttons or clipped touchscreen surfaces.
> > 
> > Thank you for your work. I think it is pretty much ready to be merged,
> > just a few small comments:
> > 
> >>
> >> In order to support these objects, add a series of helper functions
> >> to the input subsystem to transform them into overlay objects via
> >> device tree nodes.
> >>
> >> These overlay objects consume the raw touch events and report the
> >> expected input events depending on the object properties.
> > 
> > So if we have overlays and also want to invert/swap axis then the
> > overlays should be processed first and only then
> > touchscreen_set_mt_pos() or touchscreen_report_pos() should be called?
> > 
> > But then it will not work if we need help frm the input core to assign
> > slots in cases when touch controller does not implement [reliable]
> > contact tracing/identification.
> > 
> > I think this all needs to be clarified.
> > 
> 
> I think this is the most critical point from your feedback.
> 
> So far, touch-overlay processes the coordinates of input_mt_pos elements
> before passing them to touchscreen_set_mt_pos(). As you pointed out,
> that means that it does not act on the slots i.e. it assumes that the
> controller does the contact tracing and pos[i] is assigned to slot[i],
> which is wrong.
> 
> Current status:
> [Sensor]->[touch-overlay(filter + button
> events)]->[touchscreen_set_mt_pos()]->[input_mt_assign_slots()]->[report
> MT events]
> 
> If I am not mistaken, I would need a solution that processes the
> coordinates associated to assigned slots via input_mt_assign_slots().
> Then I would have to avoid generating MT events from slots whose
> coordinates are outside of the overlay frame (ignored) or on overlay
> buttons (generating button press/release events instead).
> 
> But once input_mt_assign_slots() is called, it is already too late for
> that processing, isn't it? Unless assigned slots filtered by
> touch-overlay are kept from generating MT events somehow, but still used
> to keep contact tracing.
> 
> Any suggestion on this respect would be more than welcome.

The driver is in control which slots to emit the events for, so it can
skip reporting if it wants. Consider the st1232 for which you are making
these adjustments:

	for (i = 0; i < ts->chip_info->max_fingers; i++) {
		u8 *buf = &ts->read_buf[i * 4];

		if (buf[0] & BIT(7)) {
			unsigned int x = ((buf[0] & 0x70) << 4) | buf[1];
			unsigned int y = ((buf[0] & 0x07) << 8) | buf[2];

			touchscreen_set_mt_pos(&pos[n_contacts],
					       &ts->prop, x, y);

			/* st1232 includes a z-axis / touch strength */
			if (ts->chip_info->have_z)
				z[n_contacts] = ts->read_buf[i + 6];

			n_contacts++;
		}
	}

	input_mt_assign_slots(input, slots, pos, n_contacts, 0);
	for (i = 0; i < n_contacts; i++) {
		input_mt_slot(input, slots[i]);
		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
		input_report_abs(input, ABS_MT_POSITION_X, pos[i].x);
		input_report_abs(input, ABS_MT_POSITION_Y, pos[i].y);
		if (ts->chip_info->have_z)
			input_report_abs(input, ABS_MT_TOUCH_MAJOR, z[i]);
	}

Can you call touch_overlay_process_event() from the 2nd for() loop,
something like this:

	for (i = 0; i < n_contacts; i++) {
		if (touch_overlay_process_event(&ts->touch_overlay_list,
						input,
						&pos[i].x, &pos[i].y))
			continue;

		input_mt_slot(input, slots[i]);
		...
	}

Note that you will no longer able to rely on the input core to drop
"unused" slots because you may need to generate "key up" events for
them, but you do have access to input_mt_is_active() and
input_mt_is_used() so you can implement what you need.

Thanks.

-- 
Dmitry

