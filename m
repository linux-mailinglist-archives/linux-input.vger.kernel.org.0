Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC031744B6
	for <lists+linux-input@lfdr.de>; Sat, 29 Feb 2020 04:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB2DeG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Feb 2020 22:34:06 -0500
Received: from chill.innovation.ch ([216.218.245.220]:39072 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgB2DeG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Feb 2020 22:34:06 -0500
X-Greylist: delayed 469 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Feb 2020 22:34:06 EST
Date:   Fri, 28 Feb 2020 19:26:16 -0800
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch DAD1A641360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1582946776;
        bh=66FetrplUwm8jRxUoXrybIHH+waVMHHXyn4EHDCKWfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGqVyw8PGLFdZeXYGgQCFr2UR64igu2sIoXXY1J2adCIBy7V79OlQw13hJVPUxd+O
         Q+4shaUmMw+xI7DD8mWh+l81TbEdTFJzYNc5bO3uPzEyY/roEfzDLQWXHZJZuUy1N0
         LsRFUISgHGDSK32HCVJLYhy0eCfq0G4ZnRUXNXVZLjzlMvUBO1gVyHZJqQDu/NCpmT
         PMVVsUILuH/tZnM8K4CgaYvD1vJnOwPdadrIpQUbHfSEENh9Vsn5ZVLb4ceKU1ymt+
         BouFYfdJZLQTMr5iNIHnQb6v2eOaXdOQHR3Z0PXIEPC9w8v8ggNMQtg3ioC0QS24xS
         rwUsp1BnBNvzw==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, nikolas@gnu.org,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        maowenan@huawei.com
Subject: Re: [PATCH] input: keyboard: applespi: Use new structure for SPI
 transfer delays
Message-ID: <20200229032616.GA27264@innovation.ch>
References: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Thu, Feb 27, 2020 at 02:45:34PM +0200, Sergiu Cuciurean wrote:
> In a recent change to the SPI subsystem [1], a new `delay` struct was added
> to replace the `delay_usecs`. This change replaces the current
> `delay_usecs` with `delay` for this driver.
> 
> The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
> that both `delay_usecs` & `delay` are used (in this order to preserve
> backwards compatibility).
> 
> [1] commit bebcfd272df6 ("spi: introduce `delay` field for
> `spi_transfer` + spi_transfer_delay_exec()")
> 
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> ---
>  drivers/input/keyboard/applespi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index d38398526965..d6a847e5f7e4 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -545,7 +545,8 @@ static void applespi_setup_read_txfrs(struct applespi_data *applespi)
>  	memset(dl_t, 0, sizeof(*dl_t));
>  	memset(rd_t, 0, sizeof(*rd_t));
>  
> -	dl_t->delay_usecs = applespi->spi_settings.spi_cs_delay;
> +	dl_t->delay.value = applespi->spi_settings.spi_cs_delay;
> +	dl_t->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  	rd_t->rx_buf = applespi->rx_buffer;
>  	rd_t->len = APPLESPI_PACKET_SIZE;
> @@ -574,14 +575,17 @@ static void applespi_setup_write_txfrs(struct applespi_data *applespi)
>  	 * end up with an extra unnecessary (but harmless) cs assertion and
>  	 * deassertion.
>  	 */
> -	wt_t->delay_usecs = SPI_RW_CHG_DELAY_US;
> +	wt_t->delay.value = SPI_RW_CHG_DELAY_US;
> +	wt_t->delay.unit = SPI_DELAY_UNIT_USECS;
>  	wt_t->cs_change = 1;
>  
> -	dl_t->delay_usecs = applespi->spi_settings.spi_cs_delay;
> +	dl_t->delay.value = applespi->spi_settings.spi_cs_delay;
> +	dl_t->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  	wr_t->tx_buf = applespi->tx_buffer;
>  	wr_t->len = APPLESPI_PACKET_SIZE;
> -	wr_t->delay_usecs = SPI_RW_CHG_DELAY_US;
> +	wr_t->delay.value = SPI_RW_CHG_DELAY_US;
> +	wr_t->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  	st_t->rx_buf = applespi->tx_status;
>  	st_t->len = APPLESPI_STATUS_SIZE;
> -- 
> 2.17.1

Looks good to me and tested to confirm things still work.


  Cheers,

  Ronald

