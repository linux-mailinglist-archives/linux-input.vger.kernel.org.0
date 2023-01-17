Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6B566E3F4
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 17:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjAQQpm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 11:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjAQQph (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 11:45:37 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43054227BD
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 08:45:30 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r2so31231365wrv.7
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 08:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQyUOC6kDTLZ/ntXdjxxp9Ik/xBxtHiU2Z8I4nr86nY=;
        b=aRcO1LEGkRsVQeqibfN91rCtaZf9YoSuE21y4pqTUwPhYqB7LX4f3J/QPatOfOtHZt
         dXfg6ZjL/mG8TT7uzBSQu8VSZBvrPALNJ0Z6yufY9wXYjHbXlue3h4BXyqHxYDO0JlFp
         ZmDH6AZqejmFEO10VPLmRXo3OmpyYz6ftP8AXYUyXJaG0NR3OPFIPJyUOnywdZ/mVpVp
         dHWmi1Etm5iHETztjHcb31y7eYbDpPayJUYJcggELt8I5gPY59P2ZFWOyTaG9W62wWqZ
         LUFJjsmL/Y8d7CEeOGF0OYbCKJG3jsAJM8+knuui7k7TQGoXna7ooW+0MgwNHRajr8xr
         wvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQyUOC6kDTLZ/ntXdjxxp9Ik/xBxtHiU2Z8I4nr86nY=;
        b=8GPkBdwmcX4FPdQ3s2iNuMeiI+elFbYo5zAnrRWkWWbXAO//2q6UNY6Fl8zlsG1CKX
         bQe5gHEhhG3MXC6ZS2fWMVskOgGzIM0ZFu970f9QMtWi7F+j5avR4EndohwF2lRGIJj5
         cZLHsa8Z5XQElKo5QzRyjUygaL9daTDW2eqLzrKxjQw1VAiA/DijMcG7wIdL9vqM6DKT
         75nvq+B66/4W2dJcOBTBg4YgS8aVDok7t0v4j9itVB/lj2quNleCeJwzBdG/vaI/FiU7
         Uv4EIrn6WkZdJJm9SnXQKJ/6p6MPmXhndTzixLXmUycq53kH81rfN0K+Bj90cd+K4Jum
         Ai7w==
X-Gm-Message-State: AFqh2ko8jlQKM1CIeczSrFVkvLsXwYAMMR0z7aiYbdUYkRlNLWNpJO+Y
        w+97WA65rjO4VjhhmllGX7WiUq8GlLIYQPL8
X-Google-Smtp-Source: AMrXdXscOstoefHfWmPvRBJCkGWsCrDjIKrh/iq05/7A9BxdvKYbfKZVUuyvmS0+vVgKMvItjLevww==
X-Received: by 2002:adf:d084:0:b0:2be:1eb:1f82 with SMTP id y4-20020adfd084000000b002be01eb1f82mr3058733wrh.6.1673973928677;
        Tue, 17 Jan 2023 08:45:28 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b002bdc3f5945dsm16931221wrb.89.2023.01.17.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:45:28 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH] Input: iqs626a - drop unused device node references
In-Reply-To: <Y7Rm40a+rrwxTIOD@nixie71>
References: <Y7Rm40a+rrwxTIOD@nixie71>
Date:   Tue, 17 Jan 2023 17:45:27 +0100
Message-ID: <87sfg9kt3s.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 03, 2023 at 11:33, Jeff LaBundy <jeff@labundy.com> wrote:

> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
>
> Currently, the driver never calls fwnode_handle_put(); this patch
> adds the missing calls. Because fwnode_handle_put() does not take
> a const *fwnode_handle, the const qualifier is removed across all
> corresponding *fwnode_handle instances.
>
> To facilitate this change, the logic that parses event thresholds
> is collapsed in order to limit the number of locations from which
> fwnode_handle_put() must be called.
>
> Fixes: f1d2809de97a ("Input: Add support for Azoteq IQS626A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs626a.c | 87 +++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> index 23b5dd9552dc..060efb75f8cf 100644
> --- a/drivers/input/misc/iqs626a.c
> +++ b/drivers/input/misc/iqs626a.c
> @@ -458,12 +458,11 @@ struct iqs626_private {
>  
>  static noinline_for_stack int
>  iqs626_parse_events(struct iqs626_private *iqs626,
> -		    const struct fwnode_handle *ch_node,
> -		    enum iqs626_ch_id ch_id)
> +		    struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> -	const struct fwnode_handle *ev_node;
> +	struct fwnode_handle *ev_node;
>  	const char *ev_name;
>  	u8 *thresh, *hyst;
>  	unsigned int thresh_tp[IQS626_NUM_CH_TP_3];
> @@ -509,7 +508,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  			 * Trackpad touch events are simply described under the
>  			 * trackpad child node.
>  			 */
> -			ev_node = ch_node;
> +			ev_node = fwnode_handle_get(ch_node);
>  		} else {
>  			ev_name = iqs626_events[i].name;
>  			ev_node = fwnode_get_named_child_node(ch_node, ev_name);
> @@ -533,6 +532,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  					dev_err(&client->dev,
>  						"Invalid input type: %u\n",
>  						val);
> +					fwnode_handle_put(ev_node);
>  					return -EINVAL;
>  				}
>  
> @@ -547,6 +547,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s channel hysteresis: %u\n",
>  					fwnode_get_name(ch_node), val);
> +				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -561,29 +562,12 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  			}
>  		}
>  
> -		if (ch_id != IQS626_CH_TP_2 && ch_id != IQS626_CH_TP_3 &&
> -		    !fwnode_property_read_u32(ev_node, "azoteq,thresh", &val)) {
> -			if (val > IQS626_CHx_THRESH_MAX) {
> -				dev_err(&client->dev,
> -					"Invalid %s channel threshold: %u\n",
> -					fwnode_get_name(ch_node), val);
> -				return -EINVAL;
> -			}
> -
> -			if (ch_id == IQS626_CH_HALL)
> -				*thresh = val;
> -			else
> -				*(thresh + iqs626_events[i].th_offs) = val;
> -
> -			continue;
> -		}
> -
> -		if (!fwnode_property_present(ev_node, "azoteq,thresh"))
> -			continue;
> -
>  		error = fwnode_property_read_u32_array(ev_node, "azoteq,thresh",
>  						       thresh_tp, num_ch);
> -		if (error) {
> +		fwnode_handle_put(ev_node);
> +		if (error == -EINVAL) {
> +			continue;
> +		} else if (error) {
>  			dev_err(&client->dev,
>  				"Failed to read %s channel thresholds: %d\n",
>  				fwnode_get_name(ch_node), error);
> @@ -598,6 +582,20 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				return -EINVAL;
>  			}
>  
> +			switch (ch_id) {
> +			case IQS626_CH_TP_2:
> +			case IQS626_CH_TP_3:
> +				break;
> +
> +			case IQS626_CH_HALL:
> +				*thresh = thresh_tp[j];
> +				continue;
> +
> +			default:
> +				thresh[iqs626_events[i].th_offs] = thresh_tp[j];
> +				continue;
> +			}
> +
>  			sys_reg->tp_grp_reg.ch_reg_tp[j].thresh = thresh_tp[j];
>  		}
>  	}
> @@ -607,8 +605,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  
>  static noinline_for_stack int
>  iqs626_parse_ati_target(struct iqs626_private *iqs626,
> -			const struct fwnode_handle *ch_node,
> -			enum iqs626_ch_id ch_id)
> +			struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> @@ -716,7 +713,7 @@ iqs626_parse_ati_target(struct iqs626_private *iqs626,
>  }
>  
>  static int iqs626_parse_pins(struct iqs626_private *iqs626,
> -			     const struct fwnode_handle *ch_node,
> +			     struct fwnode_handle *ch_node,
>  			     const char *propname, u8 *enable)
>  {
>  	struct i2c_client *client = iqs626->client;
> @@ -764,7 +761,7 @@ static int iqs626_parse_pins(struct iqs626_private *iqs626,
>  }
>  
>  static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
> -				 const struct fwnode_handle *ch_node)
> +				 struct fwnode_handle *ch_node)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> @@ -889,8 +886,7 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  
>  static noinline_for_stack int
>  iqs626_parse_channel(struct iqs626_private *iqs626,
> -		     const struct fwnode_handle *ch_node,
> -		     enum iqs626_ch_id ch_id)
> +		     struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> @@ -924,6 +920,20 @@ iqs626_parse_channel(struct iqs626_private *iqs626,
>  		return -EINVAL;
>  	}
>  
> +	error = iqs626_parse_ati_target(iqs626, ch_node, ch_id);
> +	if (error)
> +		return error;
> +
> +	error = iqs626_parse_events(iqs626, ch_node, ch_id);
> +	if (error)
> +		return error;
> +
> +	if (!fwnode_property_present(ch_node, "azoteq,ati-exclude"))
> +		sys_reg->redo_ati |= iqs626_channels[ch_id].active;
> +
> +	if (!fwnode_property_present(ch_node, "azoteq,reseed-disable"))
> +		sys_reg->reseed |= iqs626_channels[ch_id].active;
> +
>  	*engine |= IQS626_CHx_ENG_0_MEAS_CAP_SIZE;
>  	if (fwnode_property_present(ch_node, "azoteq,meas-cap-decrease"))
>  		*engine &= ~IQS626_CHx_ENG_0_MEAS_CAP_SIZE;
> @@ -1378,23 +1388,10 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
>  			continue;
>  
>  		error = iqs626_parse_channel(iqs626, ch_node, i);
> +		fwnode_handle_put(ch_node);
>  		if (error)
>  			return error;
>  
> -		error = iqs626_parse_ati_target(iqs626, ch_node, i);
> -		if (error)
> -			return error;
> -
> -		error = iqs626_parse_events(iqs626, ch_node, i);
> -		if (error)
> -			return error;
> -
> -		if (!fwnode_property_present(ch_node, "azoteq,ati-exclude"))
> -			sys_reg->redo_ati |= iqs626_channels[i].active;
> -
> -		if (!fwnode_property_present(ch_node, "azoteq,reseed-disable"))
> -			sys_reg->reseed |= iqs626_channels[i].active;
> -
>  		sys_reg->active |= iqs626_channels[i].active;
>  	}
>  
> -- 
> 2.34.1
