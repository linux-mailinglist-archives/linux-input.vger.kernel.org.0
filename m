Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7480B1F9EB6
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 19:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgFORly (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 13:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbgFORlx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 13:41:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6955FC061A0E
        for <linux-input@vger.kernel.org>; Mon, 15 Jun 2020 10:41:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e1so18033125wrt.5
        for <linux-input@vger.kernel.org>; Mon, 15 Jun 2020 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6FCq4WgP0izGaAubV2vb2g4JrUenOvvisl17zH9PyvA=;
        b=HdJ11LLwfeXMKVIemr6YK1GRydz5Q07Ump11P0CB+g2ql+gqLdMLMolngmgokzR58p
         YL0UGybq8ChrSaZkAxwcLJNxVXrdCNcEU0zgMXDKX9fh/dexy/svrr7AFZJ0EYg/6omy
         bU67zqWM7zzSHgl+9yILafReI/0rrLYOGmlSavluFowNWaST+6mDIcMxtcrBwCiY4sFu
         a5XFN0oK1D0XeFQo/g7EU7sNsF0lY8Kv7KJNJofXXBvXsa215xQhLvcPricufki53ezH
         +3H2M0KRg2zMPEU3hbQMiU/dChxEAXldgSeJ+awXFAxg0r3s8nV/pm1PzgWOI2VoB1Ps
         ap7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6FCq4WgP0izGaAubV2vb2g4JrUenOvvisl17zH9PyvA=;
        b=jzVhSrQWW/AWK0UYg7igD+A1Y/kCzpWVJajopadUnLC+XYmI3g5HCINkoKEE1rWtex
         Kxy8PjnTeRe5rXhNt/bOcf5eYt1PXpNt4IwOsW2xiB3iyH/Mh0goD8Z/K95l4k5lasCH
         HO9aQtJ8UNvNVLipuzLqcTrw+CQgfTfL31iK7q/x7gDysW46ECqbF8cBgAXG/XxBKlRz
         l5+Eaq5ilObkXMxcjuqKhm+Tla63usQ8/h72Ay+bujcuD2GqMXeUDTm7ZQg4ZD5mvYRN
         VInaihdMUN5rO4jJvbqcZJxM7wXCLsodkzWo76xalV56tNOZhVsCTDMQtr9fO71YaZxt
         GxFg==
X-Gm-Message-State: AOAM532i+YxnCLWIm9jNvduPGHbnYLYdAFVsLWZLDByv4qxaPwOgDBR/
        V+e6/zDC7ISLASLbUcOtQVE=
X-Google-Smtp-Source: ABdhPJynIKhzCAG5+vibeLQqJt0/jPj1MGU+ABPzol6o+R6Hkkmm2787RzMcUqUpKu0p0sEgc5DDjw==
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr31228015wrt.9.1592242912031;
        Mon, 15 Jun 2020 10:41:52 -0700 (PDT)
Received: from casa ([92.176.4.241])
        by smtp.gmail.com with ESMTPSA id t8sm292731wmi.46.2020.06.15.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:41:51 -0700 (PDT)
Date:   Mon, 15 Jun 2020 19:41:49 +0200
From:   Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: Kasan crash in hid-steam
Message-ID: <20200615174149.GA38082@casa>
References: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com>
 <20200613122235.GA11175@casa>
 <CAKF84v05UjZg-7ZrVcwExk7Jkux=siR4Y8UnMt7KV0-9BrRfzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKF84v05UjZg-7ZrVcwExk7Jkux=siR4Y8UnMt7KV0-9BrRfzg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 15, 2020 at 11:00:21AM -0500, Siarhei Vishniakou wrote:
> Thanks Rodrigo,
> 
> I ran the test 50 times with your patch, and no crashes.

Great! Let me CC the linux-input maintainers, to see if they can commit
this.

> Tested-by: Siarhei Vishniakou <svv@google.com>
Signed-off-by: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>

> Side question, is there any plan to support the beta bluetooth mode
> for this controller?
> Currently, the controller permanently stays in the lizard mode when
> connected via bluetooth.

Actually this driver doesn't even look at the bluetooth, it is in lizard
mode because that is the default when plugged in. IIRC, the BLE protocol is
also HID and quite similar to the wireless USB one, mainly the 'framing'
is different, so it shouldn't be too difficult to develop. But since
Valve deprecated this device a while ago I think this firmware will be on
beta forever, and I'm not particularly interested in that.  Maybe in the
future if I lose the original wireless adaptor...

Regards.
--
Rodrigo Rivas Costa
