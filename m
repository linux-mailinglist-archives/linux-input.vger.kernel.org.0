Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA63269992
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 19:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbfGORKq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 13:10:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45735 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbfGORKq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 13:10:46 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so8600511plr.12
        for <linux-input@vger.kernel.org>; Mon, 15 Jul 2019 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V9qvMJLkFIk5FcFJXyYj2/xAWCu+47Cbak+5MGjnt50=;
        b=G9BJsMQNMvB9LVPAY1/wXy7Wx0YGTUw3b9YurgFcSCcVnxNtAr60GF3z7WG9xjatjh
         Jr6mw0Bnh9vrYRuVuZjD2gsYZXck5VTAQXtQd4S6ZT7DDSpNlp1maCrK07gN0OapOEju
         CFvW4adxZGjW0/JYQOLYAd90Kh26X9xR6SB23i8aeLeCoJ6zORyJPcxsPOjJVZLic9ip
         IiT1NeJ7Y7SINJZJ3LjItGrPaXEduQ9W/I4nMr5IglwDg/vnrIlU50mtzQ2IaNyauGJY
         ii28jnfbqLD+67HCsPcKxvaIHGiaPLlo+uBM6Nv5tvyJ0nxQ9bgpLfwJqGf5tiPMr7Y/
         TNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V9qvMJLkFIk5FcFJXyYj2/xAWCu+47Cbak+5MGjnt50=;
        b=dTNuZ/jg1XX9WRevj2qNBV8KjDMvae2U1DX3+KPlnHgRIpKeW74vi6qLfWGaJOZOhP
         C0RUgfutNlR6zGkozaPGsPwf01+5kwhOOj0CyJkFhdNbFey28Q/AT8OFD/hACUzdiuXS
         /pYnBeFfulIB1QhiEBMk1mNtKR+ucb2KAZWRpwv9nfRNRSUfXXQcKbJoZUQhT5nZFZhT
         OSE2MQ0HXif3+vi0ABrvIJwn4tQ5EmB3f5h/qZUUh4RA6XdLMH3dj+g1dZM3UZ15gFBn
         44BFdqJtrylfMT6iZzRCVRu5BB0hf94NdDNOTL4uqYlfOaud6MysNRaG5uAJbv6/LTI1
         zKaQ==
X-Gm-Message-State: APjAAAWdGNNrjMJCVyckwANPOUP+hWA1/jh5pTLHXBKRGmAG4GQyLB38
        kAYMnxWtdHsb/jB5+NM5bog=
X-Google-Smtp-Source: APXvYqzvNhw1P9ZXEV04iaEXMCwy3bbmUKK0pyvPketIn5CmhzvxvJNBhQSofgkmjueMDlr6j41zVA==
X-Received: by 2002:a17:902:9004:: with SMTP id a4mr29668205plp.109.1563210644869;
        Mon, 15 Jul 2019 10:10:44 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q22sm15457981pgh.49.2019.07.15.10.10.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 10:10:44 -0700 (PDT)
Date:   Mon, 15 Jul 2019 10:10:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, pali.rohar@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        zhangfp1@lenovo.com
Subject: Re: [PATCH v5 RESEND] Input: alps - Don't handle ALPS cs19
 trackpoint-only device
Message-ID: <20190715171042.GA131063@dtor-ws>
References: <20190708022458.2585-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708022458.2585-1-hui.wang@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hui,

On Mon, Jul 08, 2019 at 10:24:58AM +0800, Hui Wang wrote:
> +	if ((param[0] == TP_VARIANT_ALPS) && (param[1] & 0x20)) {
> +		if (IS_ENABLED(MOUSE_PS2_TRACKPOINT))
> +			psmouse_dbg(psmouse,
> +				    "ALPS CS19 trackpoint-only device detected, not using ALPS touchpad driver\n");
> +		else
> +			psmouse_warn(psmouse,
> +				     "ALPS CS19 trackpoint-only device detected but MOUSE_PS2_TRACKPOINT not enabled, fallback to bare PS/2 mouse\n");

I do not think that trackpoint driver not being enabled deserves a
warning, especially coming from unrelated driver. As far as I understand
the device still works reasonably well when handled as generic mouse.

I condensed both messages down to "ALPS CS19 trackpoint-only device
detected, ignoring", moved it down to alps_is_cs19_trackpoint() call
site, and applied the patch.

Keeping Pali's reviewed-by as the core idea of the patch has not
changed.

Thanks.

-- 
Dmitry
