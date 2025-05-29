Return-Path: <linux-input+bounces-12641-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F9AC7731
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 06:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D963A614A
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 04:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA08D25228F;
	Thu, 29 May 2025 04:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wbvPnKdW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A47246777;
	Thu, 29 May 2025 04:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748493609; cv=none; b=lghTNr2VwK60ImtQtNK+7/iYl5PGDzVv3ZWxAA3ucU8IxFulxTI4ShqEdq9acy1pHHstiF+31qjvkymj4b3LkphqRz6xvwYkl9+AlDJC/B7u69sBWlWitDTGxTDiCSBBUBSE9O+7BVWpXzZJNHQ3w2HtsYS+bWS1YD3Kz/img6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748493609; c=relaxed/simple;
	bh=wHk7sunmAguW/8DWeD4mY7FrrUc98xyymxg26lLSFgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY7a2qqKyhPf0XqE0gIU8lt1d+e7uaI8cIiF8fqU3wizTEJWHoy4Ah/hACHvgNitk1mEDacWSAQ1ygfZ7Y0ROIDPRj0pG167tijfV0mywDpjSiCConm11tQyvClnlYLbllOiHI6ALeLp8jIg9Gohmn4Vh22eKpNNwAgSKKukueo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wbvPnKdW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0E0C4CEEA;
	Thu, 29 May 2025 04:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748493608;
	bh=wHk7sunmAguW/8DWeD4mY7FrrUc98xyymxg26lLSFgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wbvPnKdWSLtAzmdFbo/z12brOMHNboCiFPu26vna2AaDN7Y+cFCOF+mf8J4vOJTaZ
	 IjjUQ9uf2CKsuU4chSB9NDiUFySax1n3eLqkV8fZONsL9tVbVb4NlRLHtf+tkcjsCl
	 Eb1MLrB62yoNsX8l2zO09zAFqTOWrsDljOKjBHnI=
Date: Thu, 29 May 2025 06:40:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
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
Message-ID: <2025052902-dizzy-baggie-15ee@gregkh>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>

On Thu, May 29, 2025 at 12:08:45AM +0200, Marco Felsch wrote:
> +	if (!entry->info)
> +		WARN(1, "Unsupported usage u%x used, driver bug!", i);

You just crashed the system and caused all data to be lost if this is
ever hit :(

As you did detect this, please handle the error and recover.  It's a bit
rude for a single i2c driver to take down a whole system, right?

> +#define AXIOM_SIMPLE_FW_DEVICE_ATTR(attr)					\
> +	static ssize_t								\
> +	fw_ ## attr ## _show(struct device *dev,				\
> +			     struct device_attribute *_attr, char *buf)		\
> +	{									\
> +		struct i2c_client *i2c = to_i2c_client(dev);			\
> +		struct axiom_data *ts = i2c_get_clientdata(i2c);		\
> +										\
> +		return sprintf(buf, "%u\n", ts->fw_##attr);			\

sysfs_emit() please for all sysfs show functions.

> +	axiom_u42_get_touchslots(ts);
> +	if (!ts->num_slots && update_in_process) {
> +		input_free_device(input);
> +		/*
> +		 * Skip input device registration but don't throw an error to
> +		 * not abort the update since some FW updates require a
> +		 * following CFG update to re-initialize the touchslot handling.
> +		 */
> +		if (update_in_process) {
> +			dev_info(dev, "No touchslots found after FW or CFG update, skip registering input device\n");

Why is this info?  What can a user do with this?  Shouldn't this be a
dev_warn() call at the least?

> +			return 0;

You return success, but the device is NOT set up properly, how is that
going to work?

thanks,

greg k-h

