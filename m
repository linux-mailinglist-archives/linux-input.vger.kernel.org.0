Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6823F184979
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 15:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgCMOg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 10:36:29 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46499 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMOg2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 10:36:28 -0400
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jClQJ-0008RB-6x; Fri, 13 Mar 2020 15:36:27 +0100
Message-ID: <389bbd283c2ac1513ec77980917c713b26bc272e.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] Input: exc3000: query and show type, model and
 firmware revision info
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Date:   Fri, 13 Mar 2020 15:36:27 +0100
In-Reply-To: <20200120194944.GI47797@dtor-ws>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
         <20200107171741.10856-2-l.stach@pengutronix.de>
         <20200120194944.GI47797@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mo, 2020-01-20 at 11:49 -0800, Dmitry Torokhov wrote:
> Hi Lucas,
> 
> On Tue, Jan 07, 2020 at 06:17:38PM +0100, Lucas Stach wrote:
> > It's very useful to have this information in the log, as differences in
> > behavior can be tied to the controller firmware.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/input/touchscreen/exc3000.c | 116 ++++++++++++++++++++++++++--
> >  1 file changed, 110 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> > index 3458d02310dd..accee4fd1b97 100644
> > --- a/drivers/input/touchscreen/exc3000.c
> > +++ b/drivers/input/touchscreen/exc3000.c
> > @@ -22,7 +22,9 @@
> >  #define EXC3000_NUM_SLOTS		10
> >  #define EXC3000_SLOTS_PER_FRAME		5
> >  #define EXC3000_LEN_FRAME		66
> > +#define EXC3000_LEN_VENDOR_REQUEST	68
> >  #define EXC3000_LEN_POINT		10
> > +#define EXC3000_VENDOR_EVENT		3
> >  #define EXC3000_MT_EVENT		6
> >  #define EXC3000_TIMEOUT_MS		100
> >  
> > @@ -32,6 +34,9 @@ struct exc3000_data {
> >  	struct touchscreen_properties prop;
> >  	struct timer_list timer;
> >  	u8 buf[2 * EXC3000_LEN_FRAME];
> > +	struct mutex vendor_data_lock;
> > +	struct completion vendor_data_done;
> > +	char *type, *model, *fw_rev;
> >  };
> >  
> >  static void exc3000_report_slots(struct input_dev *input,
> > @@ -136,6 +141,13 @@ static int exc3000_handle_mt_event(struct exc3000_data *data)
> >  	return ret;
> >  }
> >  
> > +static int exc3000_handle_vendor_event(struct exc3000_data *data)
> > +{
> > +	complete(&data->vendor_data_done);
> > +
> > +	return 0;
> > +}
> > +
> >  static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> >  {
> >  	struct exc3000_data *data = dev_id;
> > @@ -153,6 +165,9 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> >  		case EXC3000_MT_EVENT:
> >  			exc3000_handle_mt_event(data);
> >  			break;
> > +		case EXC3000_VENDOR_EVENT:
> > +			exc3000_handle_vendor_event(data);
> > +			break;
> >  		default:
> >  			break;
> >  	}
> > @@ -161,6 +176,89 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static int exc3000_vendor_data_request(struct exc3000_data *data, u8 *request,
> > +				       u8 request_len, u8 *response)
> > +{
> > +	u8 buf[EXC3000_LEN_VENDOR_REQUEST] = { 0x67, 0x00, 0x42, 0x00, 0x03 };
> > +	int ret;
> > +
> > +	mutex_lock(&data->vendor_data_lock);
> > +
> > +	reinit_completion(&data->vendor_data_done);
> > +
> > +	buf[5] = request_len;
> > +	memcpy(&buf[6], request, request_len);
> > +
> > +	ret = i2c_master_send(data->client, buf, EXC3000_LEN_VENDOR_REQUEST);
> > +	if (ret < 0)
> > +		goto out_unlock;
> > +
> > +	if (response) {
> > +		wait_for_completion(&data->vendor_data_done);
> 
> You want some kind of timeout here to avoid hanging forever if device
> does not respond properly.
> 
> > +		memcpy(response, &data->buf[4], data->buf[3]);
> > +		ret = data->buf[3];
> > +	}
> > +
> > +out_unlock:
> > +	mutex_unlock(&data->vendor_data_lock);
> > +
> > +	return ret;
> > +}
> > +static int exc3000_populate_device_info(struct exc3000_data *data)
> > +{
> > +	struct device *dev = &data->client->dev;
> > +	u8 response[EXC3000_LEN_FRAME];
> > +	int ret;
> > +
> > +	/* query type info */
> > +	ret = exc3000_vendor_data_request(data, (u8[]){0x46}, 1, response);
> > +	if (ret < 0)
> > +		return -ENODEV;
> > +
> > +	data->type = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
> > +
> > +	/* query model info */
> > +	ret = exc3000_vendor_data_request(data, (u8[]){0x45}, 1, response);
> > +	if (ret < 0)
> > +		return -ENODEV;
> > +
> > +	data->model = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
> > +
> > +	/* query bootloader info */
> > +	ret = exc3000_vendor_data_request(data,
> > +					  (u8[]){0x39, 0x02}, 2, response);
> > +	if (ret < 0)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * If the bootloader version is non-zero then the device is in
> > +	 * bootloader mode and won't answer a query for the application FW
> > +	 * version, so we just use the bootloader version info.
> > +	 */
> > +	if (response[2] || response[3]) {
> > +		char bl_version[8];
> > +
> > +		snprintf(bl_version, 8, "%d.%d", response[2], response[3]);
> > +		data->fw_rev = devm_kmemdup(dev, bl_version,
> > +					    strlen(bl_version), GFP_KERNEL);
> 
> Error handing?
> 
> > +	} else {
> > +		/* query application firmware version */
> > +		ret = exc3000_vendor_data_request(data,
> > +						  (u8[]){0x44}, 1, response);
> > +		if (ret < 0)
> > +			return -ENODEV;
> > +
> > +		data->fw_rev = devm_kmemdup(dev, &response[1],
> > +					    ret - 1, GFP_KERNEL);
> 
> Error handling?
> 
> > +	}
> > +
> > +	dev_info(&data->client->dev,
> > +		 "found type %s, model %s, firmware revision %s",
> > +		 data->type, data->model, data->fw_rev);
> 
> dev_dbg()

This one I kept as-is, as I really want to have this information in the
system log. It's a single line and carries quite important information
when trying to understand touchscreen issues, so IMHO the signal to
noise ratio is good enough to keep it at the info level.

All other comments have been fixed in v2.

Regards,
Lucas

> > +
> > +	return 0;
> > +}
> > +
> >  static int exc3000_probe(struct i2c_client *client,
> >  			 const struct i2c_device_id *id)
> >  {
> > @@ -174,6 +272,18 @@ static int exc3000_probe(struct i2c_client *client,
> >  
> >  	data->client = client;
> >  	timer_setup(&data->timer, exc3000_timer, 0);
> > +	mutex_init(&data->vendor_data_lock);
> > +	init_completion(&data->vendor_data_done);
> > +
> > +	error = devm_request_threaded_irq(&client->dev, client->irq,
> > +					  NULL, exc3000_interrupt, IRQF_ONESHOT,
> > +					  client->name, data);
> > +	if (error)
> > +		return error;
> 
> Since you moved it to be earlier than input device allocation I think it
> will bomb if you boot when your finger touches the screen as it will try
> to dereference NULL pointer.
> 
> It is usually OK to send events through allocated
> but not yet registered input device, but I'd double-checked that
> touchscreen_report_pos() API is also safe, and then moved input device
> allocation to happen before you request interrupt.
> 
> > +
> > +	error = exc3000_populate_device_info(data);
> > +	if (error)
> > +		return error;
> >  
> >  	input = devm_input_allocate_device(&client->dev);
> >  	if (!input)
> > @@ -197,12 +307,6 @@ static int exc3000_probe(struct i2c_client *client,
> >  	if (error)
> >  		return error;
> >  
> > -	error = devm_request_threaded_irq(&client->dev, client->irq,
> > -					  NULL, exc3000_interrupt, IRQF_ONESHOT,
> > -					  client->name, data);
> > -	if (error)
> > -		return error;
> > -
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.20.1
> > 
> 
> Thanks.
> 

