Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94057A9145
	for <lists+linux-input@lfdr.de>; Thu, 21 Sep 2023 05:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjIUDWS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 23:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjIUDV6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 23:21:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2734E18E
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 20:21:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35328C433C7;
        Thu, 21 Sep 2023 03:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695266501;
        bh=rx0lV0XY3QhgXMp4TLjOqLDqdJJaH8x9Ozj9/UaXFd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m/w0/nMsnVgiNFiD0PwSWGXuKFooA/+XFlEuszfnBoM1hSUqWc2ALpw964SEwX7Up
         Rw5VfCYrVdQi6mvp3+Erngo5hYccLoiVgl+zusIfgCSUnuZqK5OKv9ZKntBXq6V8HE
         SxfG0v5N0Z4zpzBzfKG/hpfSdJcp6Bx+S/MlhdaRQ4WZ4Loz8elvrEPG4IAdKSevDY
         r9wjCDWDCm+CdaTBZ4XwHDAk279Ej34DaqdwoFYJoZwKPmvvVZcQuxk0FR/bWPchOa
         KNQ8aO76dC0bRrEUyqPlW/nfbI/rTaOaZnkXBch4ZfFmI8JvMtsrXYKLf9wj5vDCaJ
         wLx0dD0jBDBJQ==
Date:   Thu, 21 Sep 2023 11:21:38 +0800
From:   Tzung-Bi Shih <tzungbi@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
        linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 02/52] input: cros_ec_keyb - Convert to platform remove
 callback returning void
Message-ID: <ZQu2wtdyGtIl472x@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-3-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 02:57:39PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
