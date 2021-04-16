Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3634E361E30
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 12:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240467AbhDPKqd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 06:46:33 -0400
Received: from saul.pp3345.net ([163.172.111.124]:58536 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235225AbhDPKqc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 06:46:32 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Apr 2021 06:46:32 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 711469A563C;
        Fri, 16 Apr 2021 12:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1618569610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FGD7AujQBLEbJ99eMMvwOdzGe1vpLrkYendPbmAUiNg=;
        b=Z9f2335R+ZuwaKi1H5qnmISArCykgCLTZct+RoMnKu/N1PIPrsxAIvtfNTMvInGWSWU/5G
        nKaetyuG/ZkyGA5tOJl94O6rxu0dWTInU6jFcpECe28cIVbMadBi1BbCUYEg9oX+MemK9Q
        6ZuWUOdFK2/OtBvmCe4asJEvLG9sfr6VyTRa0gnQiNHNFjRjP0EmqFE//R+QxQMBIIDvwX
        QtBPmFTmO9mQHEKd2rZPclHUyl7VzU4r1DV0MoES277FpYTxsPpG+hPdQcebzmPAYeYvIk
        6A4I9YHiVWmLb+jOy3ViiUXuNzr4WT1/5P0+ZUngXVV+RAYtpQ6eT3Y/tWEWkg==
Subject: Re: psmouse serio2 psmouse.synaptics_intertouch=1
To:     =?UTF-8?Q?Andr=c3=a9_Najda?= <andre@najda.de>
References: <4438747.vXUDI8C0e8@xc1507v2>
Cc:     linux-input@vger.kernel.org
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <d81cea9f-67f4-c333-4652-e41cb837a8d5@pp3345.net>
Date:   Fri, 16 Apr 2021 12:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4438747.vXUDI8C0e8@xc1507v2>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Can you name the precise model of your laptop? Does the touchpad still work 
properly after a suspend and resume cycle?

On 16.04.21 12:14, André Najda wrote:
> [    4.315902] psmouse serio2: synaptics: Your touchpad (PNP: SYN1219 PNP0f13) 
> says it can support a different bus. If i2c-hid and hid-rmi are not used, you 
> might want to try setting psmouse.synaptics_intertouch to 1 and report this to 
> linux-input@vger.kernel.org.
> 
> I'd like to report this as being told. If you need any further information 
> please ask me. I'm happy to answer any questions.
> 
> psmouse.synaptics_intertouch=1 works fine.
> 
