Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E125471119
	for <lists+linux-input@lfdr.de>; Sat, 11 Dec 2021 04:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244380AbhLKDLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 22:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbhLKDLf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 22:11:35 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21637C061714
        for <linux-input@vger.kernel.org>; Fri, 10 Dec 2021 19:08:00 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id f125so9669231pgc.0
        for <linux-input@vger.kernel.org>; Fri, 10 Dec 2021 19:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZYuPI5JDGqtSlz4m93OTZDUKcTmGD/YMg+nA3qYi7fw=;
        b=XFgmIpumDWXcprp5be/9ldQaorwtO2/q6HpRoIdU9Hl1bY7icf1PHgcR4F+g/0obRw
         jJBsycChSTQhSVSVhLBswmZuzzT/qRrzkzeKJGYtN4bxuHUBmF4PM+c7bonjyIvCUHZW
         NVbV3/c66WO7SwqyplLu6sAqeKNjhDSZpY9e9hfQmaHg6FRTygcBkGrhqrPgKcr4lTzT
         vn6fa/iFP9Et1vkGGY5b3ZajXkt0ySsq2yE6+oyGlMfVUQ732QIFiTUnZzxF4OUogaGi
         urEncxmy5OoMbraoYvVRMjlRxGqc7fkfD60wyTX31Bwmw3YbWb+/58dHifF5gwH3eaO1
         g2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZYuPI5JDGqtSlz4m93OTZDUKcTmGD/YMg+nA3qYi7fw=;
        b=VpPluF3neXQYkGruPdC8guXpNHYqEP7wzqNcDw9H0wOzDcAZRsr0q2QF3UD2S6ZA/k
         8ImF0IzAl6l9S9ZtDm4l211dcHrR7+aKICHIEDbG+2gdjnHj78ltL2v71j5ADDJuyTF6
         MbgofFYFZ/MTTpXULuk2G+SrrSoOjfjcEbfRoyTKZAoH598p+ajpFvEQq1YFLOOQRhHU
         M3jbkSaSrBUNZHmE9sVQqndieogDrx9JO+lSKvvQSk81VbrHPmZX1BoZhILs3eWeayEL
         peZ83DtgMAS5Ww0AU/NV6m6z/pg1W5J82TbZ8WT5zDwUn4xGf0lm4T+EAcn7yhTsd9oK
         VraA==
X-Gm-Message-State: AOAM531DIjmTkMnJ2kN/6yPbIHU3nhYUG237zlPr30nFREe7bvaj+nCF
        LWRPXD445Uy8z+dbwuirw88=
X-Google-Smtp-Source: ABdhPJxGsUJiAoSsTwKNYuEBE1Qwmvgl0nk6i8i/dyc7JbgEzaPFfL6/FxYaxffL1ZGuJV7iVIyV1w==
X-Received: by 2002:a63:6b83:: with SMTP id g125mr41276200pgc.578.1639192079519;
        Fri, 10 Dec 2021 19:07:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:749:db5e:6dc8:be24])
        by smtp.gmail.com with ESMTPSA id lb4sm342266pjb.18.2021.12.10.19.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 19:07:58 -0800 (PST)
Date:   Fri, 10 Dec 2021 19:07:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 2/2] Input: silead - Add pen support
Message-ID: <YbQWDAPw/zpO0y9x@google.com>
References: <20211122220637.11386-1-hdegoede@redhat.com>
 <20211122220637.11386-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122220637.11386-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Mon, Nov 22, 2021 at 11:06:37PM +0100, Hans de Goede wrote:
> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
> +	/*
> +	 * We never report BTN_STYLUS but userspace want to see this in order
> +	 * for the device to be recognized as a pen / drawing-tablet.
> +	 */

What userspace is that? I see that udev recognizes devices with either
stylus or pen  as tablets since at least 2015.

I am really hesitant adding synthetic capabilities that do not have real
events behind them.

Thanks.

-- 
Dmitry
