Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C998B46B3E4
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 08:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhLGHdR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 02:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhLGHdR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Dec 2021 02:33:17 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84098C061746
        for <linux-input@vger.kernel.org>; Mon,  6 Dec 2021 23:29:47 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id h24so9651171pjq.2
        for <linux-input@vger.kernel.org>; Mon, 06 Dec 2021 23:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CVZBYPlBQBtdrAGgdx4kWlClTmpMkFGMwQqfZI4FrTs=;
        b=Ic/4cY4Y+i9FKSC1bCxyBWppKADXZv7YFwSCGuRgMJHkygXS5ICiUuRbCPx9rFBUoM
         TPCcnm0gYGsFkRzFJtk91swTB+cG9U+Bih2ETt4hTzpoAUyoqJVlFr/1HBWXRaXSZIg2
         9kRbSAIjjAUwCixr+SjGvazgtC7b08+ciUYnG6aJJRI9oDHVXPF9aVNlvBYZ7uvX2G6J
         5aY/1T1nXd3yh/lI9PSrzYrNZaooIp8Cuf3DZGkUdNoKGm+KgwiAwQMgp/sOvDDagFRq
         eGmNFMsezT+cGDg4cLyUsrV46EtnSO2Ir5bWSeehUlnwM7BPhIi3rKw/0xNBD6Vv0JEt
         HDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CVZBYPlBQBtdrAGgdx4kWlClTmpMkFGMwQqfZI4FrTs=;
        b=TMfPJgY6aqCSU09SGfDYu67qCA+7cgjtpo0/eIyiBuGU7Fq1LAOCvNJqD7XHKdLHJM
         GOyRyBtjyRqFMMAxQYc/OnsUFFwOU7zcYZ5KLAeLdiiTGmyxbHBGyzqT4Hg6tQGIZRuP
         sR1HQVUM8K/44q2FWqqPRkC2I6Qj6jt8IHPRZJsuR2WysA/4ko/gus8rRs5O9ocT2UuI
         fgy5XHIslCMpI4V39L/1fD66PFYM5/Wv4xkJkp8xRAjCpHFfHAQAdkyDnT0vlloeVx9h
         U7lqSUAAl9y6HKgMUOfRkDE6YzmxFdPQZlk3eZqry8xUDFCnxk8YCZcGFzkJI2KS3ptO
         fAcA==
X-Gm-Message-State: AOAM5333t1wtL9lrnaq8Tllgm/xZnQqPQIPTZbFY1QQIc+8qnq9+VTwh
        Dbfj9FDPzxphzMJGs0htwMnGCpSsDCU=
X-Google-Smtp-Source: ABdhPJxQVWKK/ligdnhZNEw6elcQD31d4ymUq/XqIhaASBv1yWYuFoH3geVw2eFUElRbKxvavbbHVQ==
X-Received: by 2002:a17:90b:124d:: with SMTP id gx13mr4632126pjb.106.1638862186972;
        Mon, 06 Dec 2021 23:29:46 -0800 (PST)
Received: from google.com ([2620:15c:202:201:25b0:d110:b844:ea00])
        by smtp.gmail.com with ESMTPSA id d12sm15611931pfu.91.2021.12.06.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 23:29:46 -0800 (PST)
Date:   Mon, 6 Dec 2021 23:29:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: goodix - Add id->model mapping for the "9111"
 model
Message-ID: <Ya8NZ3R5AZt7+a1Y@google.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206164747.197309-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 06, 2021 at 05:47:44PM +0100, Hans de Goede wrote:
> Add d->model mapping for the "9111" model, this fixes uses using
> a wrong config_len of 240 bytes while the "9111" model uses
> only 186 bytes of config.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
