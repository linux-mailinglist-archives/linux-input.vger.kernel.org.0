Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2681E78CAD
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 15:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbfG2NWY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 09:22:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39078 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387413AbfG2NWY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 09:22:24 -0400
Received: by mail-io1-f66.google.com with SMTP id f4so119937769ioh.6;
        Mon, 29 Jul 2019 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vzLD2iW6uYsbIT0oPIQPOII/1STR8lKUywRD1hVm9Ws=;
        b=Kvbooi9hS7TpZtc5jFcX5PRvKHvgvbySDxOdPNmd6gpDPiNcAlamrAZrG8gFqhFsUA
         LJB/9aVGl1zFn71NgI8QOz0JVeC873/494ALaAuQ95RyBaA2MbDO4KHBmj/eePkbT5oX
         5uRnjkZ4BFqoMqy1/62sMqXQ8CrfBt+VWz5jhAzmX8LKu7hofqCX9oYQD42ybccxf+2x
         IpBCbE21sCuCn/PCxMQ5nZcq9qDDiuZOLxJoznJuTyuYP7EL+7wo/bjq6ExhCLQEFYTX
         4asN+xx2/PVIaekt5ux8AGz6JMSCTLjRcAFUFtqkSgKxQTeS019KHPP9Id1vgD4BYa38
         uU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vzLD2iW6uYsbIT0oPIQPOII/1STR8lKUywRD1hVm9Ws=;
        b=DESzfwEu64SiwrblxdRA8HHqQSl45nSA3aa/lVxZoAhCikig886nGEAWeoTXyQn9MC
         GAcaVv5p+VzPVTAEA11pNX3kCVZdzWA8Uc/NPIvPagbLlO7euGHR5PLA0PoamCzxmqJ/
         KsKkElUFy1+oYk3UvKsqBgrtTvyZF1EZ4i3//U6uH+B9ZCpKTTiUzahwy+Bvq/MBqpqt
         RkG+iUcZrCs2MTPd6NE7LO6t/o62PEBFQi9alD4NcH8tGSu0Ax43AAkMVzSnnUtkxpU8
         cKVHVCiT7xqnuEO9N4QcvB49JnqzBpc4R7I0qd6r41GizBhQrceMHYlpPYmaDoPLnQv5
         41lg==
X-Gm-Message-State: APjAAAUEyfyxqPbvgLn+DmYqjuPp48CH3MmXU/jJUCp5QDluo4RHNQu5
        SjRoAGi2j/B1OC0MJ3fFCHg=
X-Google-Smtp-Source: APXvYqzMeV7wkb+weEmw78A/cpDyd/pc6AwnkmTtO1Nt+ZrZ2TjKjg197LjIOZicn/nJBqgjJ5UasA==
X-Received: by 2002:a5d:834f:: with SMTP id q15mr30847950ior.59.1564406542921;
        Mon, 29 Jul 2019 06:22:22 -0700 (PDT)
Received: from localhost ([8.46.76.96])
        by smtp.gmail.com with ESMTPSA id u4sm59826788iol.59.2019.07.29.06.22.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 06:22:21 -0700 (PDT)
Date:   Mon, 29 Jul 2019 15:22:03 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>,
        Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: applespi - register touchpad device
 synchronously in probe
Message-ID: <20190729132203.GB1201@penguin>
References: <20190721070523.24695-1-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190721070523.24695-1-ronald@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ronald,

On Sun, Jul 21, 2019 at 12:05:23AM -0700, Ronald Tschalär wrote:
> This allows errors during registration to properly fail the probe
> function.
> 
> Doing this requires waiting for a response from the device inside the
> probe function. While this generally takes about 15ms, in case of errors
> it could be arbitrarily long, and hence a 3 second timeout is used.
> 
> This also adds 3 second timeouts to the drain functions to avoid the
> potential for suspend or remove hanging forever.

Question: is it possible to read command response synchronously as well?
I.e. I was wondering if we could add 2 (or 1?) more read xfers for the
actual result that is coming after the status response, and then we
could use spi_sync() to send the command and read the whole thing.

Thanks.

-- 
Dmitry
