Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF76EF1A1
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 01:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbfKEACu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 19:02:50 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45068 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfKEACu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 19:02:50 -0500
Received: by mail-pg1-f195.google.com with SMTP id w11so2342316pga.12
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2019 16:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0VRivaR7wzrsjZlH7POsEZeSeTHP4TX3ymcrG/cO6KA=;
        b=rMm8/xZkN70pC2p+CD0/HIUtg2MmdDLhohN4/NyYw53NiC1r15fyA8pATXPC7+h3sn
         mzxutIPCE3t9gGgXNqpZDeiHBpy8xJAkpN75BIWT/mKw/Hs7KCNZIFC3M3Jrbf3gF2i2
         zN05SqrbgNYgCeYNoov8Rq5S7BIMzdHyuOjPz3Uqlll7EDzilVkk1Cnvkvk69J2fvGGr
         5S0w0T9yvqW+Qtjq0cEf5FvEkARy4fuw8JOTgt0AQEbn9uM82VRZcBz7dq8uTAXjvtxV
         uMQsiYDsZcRfKHg7vUFwtJ87c0PqU9YIJ7gn0apvWxWXB2Ar3zFTYb6OBPQ8EjaTSPTJ
         UGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0VRivaR7wzrsjZlH7POsEZeSeTHP4TX3ymcrG/cO6KA=;
        b=AsBT7IoJRmCJjd21j2ji9+66X+2EiA/c11BWgxUS+QPJxFRiJLI0EEUZxanIFX1VQY
         tK/GBB4LhVOO8mRv8i8KuGNIO3h6Zj5Ags/4TJrpsYZeAzN87tsWDx5dKjr5TDFY0XRJ
         K0p2pAYGeuC6Bz+/PXvHnLDfVgywcCc+H5MK/+QeBfL/q6R9ISF/9bXV4sXMz2BE3Zvb
         6nC5ZwsYWvO3Pjks796nhZE20xlA9zmM5vLGfPdtE8KePNSHipWfUGAai3fBAtIbXkhT
         JfSl+q2IA5o9yNxBbCsUVxXNf7s+sh9VA0ceknbtjx388b0mR+tcHM7kt25+Bfd+llcR
         4sGg==
X-Gm-Message-State: APjAAAWOqZnchT5qLBUYXy24FHhqzlda2MkxHtOP564oB265U25/IZU6
        2WUYbYxXkWcDvyhnPMIEZkk=
X-Google-Smtp-Source: APXvYqzsX00bWbdxWt3ol5HZhNzejxK/z8M9Eh0vVBHEEMThmN035x5WqB1x+4vARoUvhXDPtuIR5g==
X-Received: by 2002:a17:90a:2e18:: with SMTP id q24mr2382709pjd.61.1572912169059;
        Mon, 04 Nov 2019 16:02:49 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r24sm12198709pgu.46.2019.11.04.16.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 16:02:48 -0800 (PST)
Date:   Mon, 4 Nov 2019 16:02:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: Re: [PATCH resend 3/3] Input: synaptics-rmi4 - simplify data read in
 rmi_f54_work
Message-ID: <20191105000246.GR57214@dtor-ws>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
 <20191104114454.10500-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104114454.10500-3-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 12:44:54PM +0100, Lucas Stach wrote:
> The body of the for loop is only ever run once as the second standard_report
> element is never changed from its initial zero init, so the loop condition is
> never satisfies after the first run. Equally the start member of the first
> element is never changed from 0, so the index offset is always a constant 0.
> 
> Remove this needless obfuscation of the code and write it in a straight
> forward manner.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f54.c | 48 ++++++++++++------------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> index 22390e89c680..5b1799bdfb62 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -81,11 +81,6 @@ static const char * const rmi_f54_report_type_names[] = {
>  					= "Full Raw Capacitance RX Offset Removed",
>  };
>  
> -struct rmi_f54_reports {
> -	int start;
> -	int size;
> -};
> -
>  struct f54_data {
>  	struct rmi_function *fn;
>  
> @@ -98,7 +93,6 @@ struct f54_data {
>  	enum rmi_f54_report_type report_type;
>  	u8 *report_data;
>  	int report_size;
> -	struct rmi_f54_reports standard_report[2];
>  
>  	bool is_busy;
>  	struct mutex status_mutex;
> @@ -516,13 +510,10 @@ static void rmi_f54_work(struct work_struct *work)
>  	struct f54_data *f54 = container_of(work, struct f54_data, work.work);
>  	struct rmi_function *fn = f54->fn;
>  	u8 fifo[2];
> -	struct rmi_f54_reports *report;
>  	int report_size;
>  	u8 command;
> -	u8 *data;
>  	int error;
>  
> -	data = f54->report_data;
>  	report_size = rmi_f54_get_report_size(f54);
>  	if (report_size == 0) {
>  		dev_err(&fn->dev, "Bad report size, report type=%d\n",
> @@ -530,8 +521,6 @@ static void rmi_f54_work(struct work_struct *work)
>  		error = -EINVAL;
>  		goto error;     /* retry won't help */
>  	}
> -	f54->standard_report[0].size = report_size;
> -	report = f54->standard_report;
>  
>  	mutex_lock(&f54->data_mutex);
>  
> @@ -556,28 +545,23 @@ static void rmi_f54_work(struct work_struct *work)
>  
>  	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "Get report command completed, reading data\n");
>  
> -	report_size = 0;
> -	for (; report->size; report++) {
> -		fifo[0] = report->start & 0xff;
> -		fifo[1] = (report->start >> 8) & 0xff;
> -		error = rmi_write_block(fn->rmi_dev,
> -					fn->fd.data_base_addr + F54_FIFO_OFFSET,
> -					fifo, sizeof(fifo));
> -		if (error) {
> -			dev_err(&fn->dev, "Failed to set fifo start offset\n");
> -			goto abort;
> -		}
> +	fifo[0] = 0;
> +	fifo[1] = 0;
> +	error = rmi_write_block(fn->rmi_dev,
> +				fn->fd.data_base_addr + F54_FIFO_OFFSET,
> +				fifo, sizeof(fifo));
> +	if (error) {
> +		dev_err(&fn->dev, "Failed to set fifo start offset\n");
> +		goto abort;
> +	}
>  
> -		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr +
> -				       F54_REPORT_DATA_OFFSET, data,
> -				       report->size);
> -		if (error) {
> -			dev_err(&fn->dev, "%s: read [%d bytes] returned %d\n",
> -				__func__, report->size, error);
> -			goto abort;
> -		}
> -		data += report->size;
> -		report_size += report->size;
> +	error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr +
> +			       F54_REPORT_DATA_OFFSET, f54->report_data,
> +			       report_size);
> +	if (error) {
> +		dev_err(&fn->dev, "%s: read [%d bytes] returned %d\n",
> +			__func__, report_size, error);
> +		goto abort;
>  	}
>  
>  abort:
> -- 
> 2.20.1
> 

-- 
Dmitry
