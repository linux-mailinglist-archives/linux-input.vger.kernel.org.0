Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D131D0267
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 00:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgELWfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 18:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgELWfB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 18:35:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3379FC061A0C;
        Tue, 12 May 2020 15:35:01 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t11so6848911pgg.2;
        Tue, 12 May 2020 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7+zhIc/fwDYcd8ufi3WBl3kj3KkGaiVHWQH/31qindI=;
        b=cgLVn055m+2Ol9tQS4JSwyPsqjKnhp/iCC9XXq5yE8Vs6Z8xbyl3dhnnnpdxOuN13D
         fMes1ZVUkz+w5qOTas8aln0MznEi/i23cdZ26i16N5zHuCoJ3R1W6shAvMP0+MQqC3G+
         /pWyxeOLb7x6SY03TX2ZB2g6QrkoRgN52GEnpYDyXufYOIjwuqF0LSQ+cZynuNnrFGX1
         LA7Yih26QmqQh9Lg4NxaEJN9DoHuyhcVhsgj7ScOsaWNC9MUBKf7R3rC4OQULEjJb8uI
         jkrztWTYNSNPK4MXsdnNQSBddIbegH5CXfsZnPckKyEGEQCqNXKdQetKkldCFlNV4//s
         Vb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7+zhIc/fwDYcd8ufi3WBl3kj3KkGaiVHWQH/31qindI=;
        b=lnw0XlGQeimUCx/kNhppTPXvl85E/LomMccNGQnnmHuNjQ6IiHWDo6YEYWmHqTWtTc
         jCqgItZgUhKjTNCToD4eOwOnoFbeXm3UwI6NGneP4M8GmdjVDUbNfDGsf9W99TGyzfaM
         kiiBw5OWONKNxrTF8qiBFfMFwUz9egurIQSj1nhIEz3biCZKLXbWTFtxP9VRVtUW+aAT
         yRblLb2oz5YAsleGdMUi173ppGB0FkDSjET0fVBmNJQO42T1NFJlz1PiZGeWUWnXlZZx
         hW9JCIyIopbze0smf0Y5CLUS7R0mCq+OvzT18+Fjz8EIUGIGosogl7kc5z3My3e3WFXn
         QLiQ==
X-Gm-Message-State: AGi0PuaXYWKg0F0t84JcpZrh6fYhOVErCSY8Phu2a3DlxAVPE9RzIUtV
        u0bhKUbXY2+pVK0MH/6lN/E=
X-Google-Smtp-Source: APiQypIw4NpgZ8EXWNOFOMopTUOZTuJoJ1OeAbaIl0eOOLYNqFZAhp3P6nThOwKEHWT98oZvAGaf9w==
X-Received: by 2002:a63:c241:: with SMTP id l1mr21720313pgg.42.1589322900568;
        Tue, 12 May 2020 15:35:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t188sm11407012pgc.3.2020.05.12.15.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:34:59 -0700 (PDT)
Date:   Tue, 12 May 2020 15:34:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c: Provide an attribute to show
 calibration count
Message-ID: <20200512223457.GD89269@dtor-ws>
References: <1588754932-5902-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588754932-5902-1-git-send-email-johnny.chuang.emc@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 06, 2020 at 04:48:52PM +0800, Johnny Chuang wrote:
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
> 
> There is an non-touch case by non-calibration after update firmware.
> Elan could know calibrate or not by calibration count.
> The value of '0xffff' means we didn't calibrate after update firmware.
> If calibrate success, it will plus one and change to '0x0000'.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>

Applied, thank you.

-- 
Dmitry
