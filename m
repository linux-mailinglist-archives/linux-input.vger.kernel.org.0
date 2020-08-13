Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4292439B7
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 14:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHMMVD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 13 Aug 2020 08:21:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58628 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMMVC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 08:21:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 1197F299E38
Received: by earth.universe (Postfix, from userid 1000)
        id 42CA73C0C80; Thu, 13 Aug 2020 14:20:59 +0200 (CEST)
Date:   Thu, 13 Aug 2020 14:20:59 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCHv4 4/4] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200813122059.hhf5qjnbwiyh2exg@earth.universe>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-5-sebastian.reichel@collabora.com>
 <20200807003901.GQ1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200807003901.GQ1665100@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Aug 06, 2020 at 05:39:01PM -0700, Dmitry Torokhov wrote:
> Hi Sebastian,
> 
> On Wed, Aug 05, 2020 at 06:05:20PM +0200, Sebastian Reichel wrote:
> >  
> > +static int exc3000_query_interrupt(struct exc3000_data *data)
> > +{
> > +	u8 *buf = data->buf;
> > +	int err;
> > +
> > +	err = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	if (buf[0] != 0x42)
> 
> I changed this to 'B' to match the rest of the function.

OK. I assumed this to be a easter egg reference to the Answer to
the Ultimate Question of Life, the Universe, and Everything from
the Hitchhiker's Guide, so I left it as a number. I might be totally
wrong on that one, so fine with me.

> > +		return -EPROTO;
> > +
> > +	if (buf[4] == 'E')
> > +		strlcpy(data->model, buf+5, sizeof(data->model));
> > +	else if (buf[4] == 'D')
> > +		strlcpy(data->fw_version, buf+5, sizeof(data->fw_version));
> > +	else
> > +		return -EPROTO;
> > +
> > +	return 0;
> > +}
> > +
> > +	error = sysfs_create_group(&client->dev.kobj, &exc3000_attribute_group);
> > +	if (error)
> > +		return error;
> > +
> > +	error = devm_add_action_or_reset(&client->dev, exc3000_unregister_sysfs, &client->dev);
> > +	if (error)
> > +		return error;
> 
> Replaced 2 calls with devm_device_add_group().

ah, I missed that because it does not have sysfs in its name and its
not in the <linux/sysfs.h>.

> Please yell if I managed to break it...

The touchscreen works as expected, sysfs files are created and
removed correctly and also work as expected. All looks good.

-- Sebastian
