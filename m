Return-Path: <linux-input+bounces-12651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8EAC8B49
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 11:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72DBB188FD39
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 09:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3F8220F3B;
	Fri, 30 May 2025 09:41:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D72253BD
	for <linux-input@vger.kernel.org>; Fri, 30 May 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598062; cv=none; b=YyyVusR9VzphnYP8BhQRM0CN+/rWJfw8g31v/Ka8jIKf88esy3qD1jdKfdoE2r6dVQ+gd55kFB7ebzFwQOQ2MDPndRkqy0F+d6GnKN6q5DS6BVXMK6tVNp4ia/Hclps4Zw0gdfEMudDeh3aj/AUNTt+8qtc0CLUqY1qUYxw5NpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598062; c=relaxed/simple;
	bh=9L46h2bC/ZzRvJPhqqnbE6d9vQTHTHOjJrh/9UoHbpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReZGHQ9xe8iVFBf6+3QbVhKEIWux80kPwuUr0Y2PZ+kRTtel84zEe+bS6WZeRQXQbzdNDImFdDS7G0C8kfMr0cxbtYCc1ydHopBgEDap/kyI3CJnM64RIaF6jH2EZ1O3ed/1e/8/Uc24Thp4ioiV+7WQIjwHMtMEuWgNgc5VZxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwED-0000T2-LD; Fri, 30 May 2025 11:40:41 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwEB-000xGk-2I;
	Fri, 30 May 2025 11:40:39 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwEB-000pOI-1s;
	Fri, 30 May 2025 11:40:39 +0200
Date: Fri, 30 May 2025 11:40:39 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <20250530094039.n5236kxskha4vrhd@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
 <2025052902-dizzy-baggie-15ee@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052902-dizzy-baggie-15ee@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 25-05-29, Greg Kroah-Hartman wrote:
> On Thu, May 29, 2025 at 12:08:45AM +0200, Marco Felsch wrote:
> > +	if (!entry->info)
> > +		WARN(1, "Unsupported usage u%x used, driver bug!", i);
> 
> You just crashed the system and caused all data to be lost if this is
> ever hit :(
> 
> As you did detect this, please handle the error and recover.  It's a bit
> rude for a single i2c driver to take down a whole system, right?

Good point.

> > +#define AXIOM_SIMPLE_FW_DEVICE_ATTR(attr)					\
> > +	static ssize_t								\
> > +	fw_ ## attr ## _show(struct device *dev,				\
> > +			     struct device_attribute *_attr, char *buf)		\
> > +	{									\
> > +		struct i2c_client *i2c = to_i2c_client(dev);			\
> > +		struct axiom_data *ts = i2c_get_clientdata(i2c);		\
> > +										\
> > +		return sprintf(buf, "%u\n", ts->fw_##attr);			\
> 
> sysfs_emit() please for all sysfs show functions.

Sure.

> > +	axiom_u42_get_touchslots(ts);
> > +	if (!ts->num_slots && update_in_process) {
> > +		input_free_device(input);
> > +		/*
> > +		 * Skip input device registration but don't throw an error to
> > +		 * not abort the update since some FW updates require a
> > +		 * following CFG update to re-initialize the touchslot handling.
> > +		 */
> > +		if (update_in_process) {
> > +			dev_info(dev, "No touchslots found after FW or CFG update, skip registering input device\n");
> 
> Why is this info?  What can a user do with this?  Shouldn't this be a
> dev_warn() call at the least?

Please see below.

> > +			return 0;
> 
> You return success, but the device is NOT set up properly, how is that
> going to work?

As explained in the comment. If a firmware update changes the register
layout you may end up in such a situation. A subsequent CFG update is
required to provide a correct FW+CFG match.

We don't throw an error because the FW update itself was successful but
a CFG update is required, therefore I went with the dev_info() but I can
change this to dev_warn().

We don't know which combination requires a subsequent CFG update, e.g.
there is a FW version 4.8.9 which comes in a 2D and a 3D flavour. Tests
showed that updating from a 4.8.9 2D FW to a 4.8.9 3D FW don't require
updating the CFG. Also minor FW updates may not require to update the
CFG.

Regards,
  Marco

