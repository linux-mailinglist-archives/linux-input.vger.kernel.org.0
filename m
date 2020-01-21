Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03380144683
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 22:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgAUVeq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 16:34:46 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:33623 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgAUVep (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 16:34:45 -0500
Received: by mail-pg1-f174.google.com with SMTP id 6so2235555pgk.0
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2020 13:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I18DxLC+IvKxsXR/JuvN1uuByhHfT+oS5l19yxEjbms=;
        b=PyG5fCa9gvz3spmoOJefdYK+DCdpTdmSlhMj9lu7nABkWjhZXK+kSo+skjEHyzCLn0
         eFYyhkd+DYru06tdYnHj+pt5XMf/7jGpleo5/3yMS5oi5MDIFPwrrrAaQvsM2aJBGQjq
         l6DZiVBI6behPqA8We1hCTX2vE6URWaasLzDTycH/fyBKsc9CC3aAVYBiuECPF/+WR5t
         3NUcu/ppjN9hGIfrV49c60H3ZMsqkh0UgUj+qw2SwY1VC5KJMXkvEGCy7TXkNKM4ate8
         5kOWSwc81CElNjIxiEX2dOvgYyJYhgF1A4AukjnC3W4m541jZZthtl3YJbvDoju/0zOv
         jRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I18DxLC+IvKxsXR/JuvN1uuByhHfT+oS5l19yxEjbms=;
        b=Xy7OUyoWEa98rUhVkyUg2S2VaQlQob9cucCkKhngEbolZky3qJ19gVu2m9C0ii7ysA
         vpB5+4ElbfbbRCW7FR09AUWp5kGTm6VrAVWn2TY9Kz+W6vQD8+L4S+7dLelyFNVZRmls
         uq5AVoszK1XVQhY+0cDyqWtLCspBVm7eky9GSaUPNtQPZZ8E70gL4Dg9T5KpOA/gapg8
         KsGjqxhr9OdF18ZA0tMDI4F0yztjD+8gPmd8Tl3YUKd4tFsYgCgM45GzvEcyvo6bmo63
         Jvz3KFDL9a3rqF2gxK2lm3jlZ7jPo0jtUKQArLHCnG4Zujg72fq8wQv9MQAXQHHTx07+
         n6jg==
X-Gm-Message-State: APjAAAX5Fwr4wLSlhEQlZdW0UAMcRJywwR6hpjqI2Gdn1db8uelyQRKi
        c2BH2S9GjLJwCOl58olaouk=
X-Google-Smtp-Source: APXvYqxo+M/Le0MUnaolOuqGuh2LbT69O1wxF5c5yDI/JuZsM2hCl3U247l08yO1xFzru10RV4N3zQ==
X-Received: by 2002:a63:4a50:: with SMTP id j16mr4232223pgl.323.1579642484112;
        Tue, 21 Jan 2020 13:34:44 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c18sm43951403pfr.40.2020.01.21.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 13:34:43 -0800 (PST)
Date:   Tue, 21 Jan 2020 13:34:41 -0800
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC] linux-input alps - loosing precision
Message-ID: <20200121213441.GO47797@dtor-ws>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
 <20200117094206.xu47p6ybxmsf5ne2@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200117094206.xu47p6ybxmsf5ne2@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pali,

On Fri, Jan 17, 2020 at 10:42:06AM +0100, Pali Rohár wrote:
> On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1) wrote:
> > Hello,
> > 
> > At the file
> > https://github.com/torvalds/linux/blob/master/drivers/input/mouse/alps.c
> > I've seen that values coming from the trackpoint/trackstick are divided at some devices, which results in a loss of precision.
> > 
> > As I was not lucky with the behavior of the trackpoint of my computer I've made a fork of libinput https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> > where I changed  src/filter-trackpoint.c . With this change, the values from lib evdev are multiplied by a factor (dpToFac_au16 []). The array element used from dpToFac_au16 [] is also the value received by evdev.
> > 
> > At higher forces I use a factor much higher than 1, so the undivided value from the device would be the best for me.
> > 
> > In order not to change the behavior for other users, it might be possible to change the divider at runtime via the sys- file system - like it is at trackpoint.c and take the currently used divider as default value.
> > 
> > Positions at source code were I see the division:
> > 
> > alps_process_trackstick_packet_v3()
> > /*
> > * The x and y values tend to be quite large, and when used
> > * alone the trackstick is difficult to use. Scale them down
> > * to compensate.
> > */
> > x /= 8;
> > y /= 8;
> > 
> > alps_process_packet_v6()
> > /* Divide 4 since trackpoint's speed is too fast */ input_report_rel(dev2, REL_X, (char)x / 4); input_report_rel(dev2, REL_Y, -((char)y / 4));
> 
> Hello Dmitry!
> 
> This problem is about fact that alps.c for some ALPS devices already
> truncate precision of trackpoint movement.
> 
> Tobias is unhappy with this fact and would like to get all bits of
> movement information, not just some high.
> 
> But existing userspace application expects that for these devices kernel
> already truncate precision and process truncated data from kernel.
> 
> Now question is: Are we able to send to userspace input data without
> doing truncation and without breaking existing applications?
> 
> It looks like that for such thing we need some userspace <--> kernel API
> which disable truncating of precision.
> 
> Have you been solving similar issue for other other drivers or in other
> area of input code?

Unfortunately I do not think we can automatically "recover" the lost
precision without help of libinput, which would need to tweak the
trackpoint [sysfs] property letting kernel know that it should send
original data.

I'm adding Peter to hear his take on this.

Thanks.

-- 
Dmitry
