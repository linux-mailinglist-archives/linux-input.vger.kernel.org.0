Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D543FE2317
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 21:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390104AbfJWTGl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 15:06:41 -0400
Received: from mout.gmx.net ([212.227.15.19]:35309 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389752AbfJWTGl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 15:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1571857591;
        bh=NVRClDoT2pFq/Mxroyukh7fqaOMsuH7t/ArRN4BEHz8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Bgd9v1xBVNZCAF+QI79raFWxOvE5HCMG0XFjpSfCZvZC7Bh7CWgktpjabkjzfvCfY
         8SKlsO536wuAp3Ap20Bp3PkqRs457wAzgv2TmsgqG+zZ7zUotjodK80I1U6bgMFQuL
         InEN0tiFtIDwYqRVk0G4eTI+X+D5y14hvT2+2XAs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.141.241]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MStCe-1ia2ki3NXi-00UFhU; Wed, 23
 Oct 2019 21:06:30 +0200
Subject: Re: [PATCH] Input: hp_sdc_rtc - remove dead chardev code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-parisc@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191023142521.3643152-1-arnd@arndb.de>
 <20191023152222.GP3125@piout.net>
From:   Helge Deller <deller@gmx.de>
Message-ID: <50a48356-294d-516d-6448-ee06273fd014@gmx.de>
Date:   Wed, 23 Oct 2019 21:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023152222.GP3125@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LrhuiyxOXMe3GvrSDs0BXS24YF9aoD9Ukw0saj/x8IeyyaZ9UKY
 vW0wz9xJwo14Cpqsu1uEHwTNjp/OOoHzGPesiH8DboagGPoobCpXWeXbiCA0hQXod+sFa9Q
 dsgetXfKi+rqJp5uA3JQTHKOuVs4J2uCZANecI2q4gwGzDAwEyBYESNLz/inSCtVOeA2xqS
 RJs6DbjULnxDFRk6FIc5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+VvP63iMY5g=:ibhes66qykoNNaavzHUx1Y
 G/U3AM9lUQUTdDxnTkHoVTW94WD2xRcVPbAHenz4nBKT9QI0720lU33ynwb66NMBHZx8i45Jm
 hHSfM0eAr8fsUxVnsTuz3bpkHOi4f7yAsWRZWbvHBhLeoV2Ej3Fo+wsUFO65fy5fu08+VWV7C
 JGxTJ3EDBbDyQESxE1E71xZP/3lYEiurYqrm5oOmKdz/LT5C6pX3UrMhzVAT7/JmzO4nuLq9Q
 I1K7ZgC9eD/A2AdTTJB9CTKRlnIi4O8OQyhpqX1YwSW0OWPcx2FXN1qdkzJbbnAFJxrHU5nGi
 ZI53NA03dM7uHNh0Fqg13dnFY2HP5sCPXPV3TwwoX6KE1okDX3Amqy1ms1yoBIatGpC2qrngR
 aAIHylNoWmkcpX5Vi4uHBdV4DY1oCHhD+KTcDmMoH0fBbpRFIXqQeSiOTcfxzOZzRSEtK6zaq
 AN/IxYLmnpd2vR1PDybz18TzBtCRA1mB8R5GgIHoBaxC/BO3iEcihZX8648ilt+q7weXUjouK
 GwpBl7a2Y7mq1a1uFICHE4qotBWE4LlM7JDmzGybVps4spaQkV5/iBlKHiXuLr/NceljUpSrT
 5dG5G+LZ1GYLow9fvWbF7xVLDJcmqqJIqlTdQ9DCpfrJlJ/wsr9aO2SpfUihUMm8ZCKq2YXDj
 arC4a1v5o13hR4nd8EhKljaPgaeAvxmhDl0A/y5eo5rv387y+RRQQ34ghinxjae1Gys9DdoNG
 WruKHpL1yL4em6ySd0DDivY9hjVtAUzda4CwrjoGdSQ3I2BS+C5e1ctInitfWc+oQ22dyYt8a
 fGMC9CE8NdabC6xsRCcqt/yZ9tQtu2IZquBdWfvNj4E0ZcRfWXJlCIG8XkVpvTlkzuF9YjvVn
 DBj59zqm71puqJt2cJR99gp9Qgfd3hqkwh/kaSTdv7ALYcVHDiVWJDipBZHNCy0EqyRxVEjdk
 U3ZnpV6qvVACIubh0dRw6cCoWXo0Hha3If5GKcy6P0kAbvRPkcktcOj+Oe8JtrbvTXyWGrT4I
 VCPHrVfjUXyI+PdEdBV+TuNR8Zj6Tq9YKITYOccW1h2wnfirz9g58s4MBovd/CJKans6GCEAk
 9kchAdUUR+MsrNUaP+kReBul4ua8IyosLp5Y+cjIUDKlJ49sBER3kD54aWDSZ3agmz3IZlFC/
 WBRtdXs9Q3TINqP+MxTMA3Jt5jFLoTHiO8bh+G7gjuR3cdIkYuz0znhH3PeffzKgCPYq1Tbsm
 xG5RWVsQx8wfygOM9pkjoA4gdI142y+N3hn+XdQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23.10.19 17:22, Alexandre Belloni wrote:
> On 23/10/2019 16:25:02+0200, Arnd Bergmann wrote:
>> The driver contains half of the implementation of /dev/rtc, but this
>> was never completed, and it is now incompatible with the drivers/rtc
>> framework.
>>
>> Remove the chardev completely. If anyone wants to add the functionality
>> later, that shoudl be done through rtc_register_device().
>>
>> The remaining portions of the driver basically implement a single
>> procfs file that may or may not be used anywhere. Not sure why this
>> is in drivers/input/ though.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

A year ago I did actually converted this driver to the RTC framework.
But after some testing on my physical box (a 715/64 PA-RISC machine
with HIL connector) I realized that the SDC in that machine doesn't
provide a functional RTC, and even more important, on that box we don't
need this RTC because the system provides a built-in RTC on-mainboard inst=
ead.
So, I never pushed my changes upstream, which can still be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dhp_sdc_rtc_conversion&id=3D0d4250dbcfa2bb8b326ce7721e19e10a66f1e=
b92

So, I don't think any PA-RISC machine needs this driver, and as such
I'm happy to give my:
Acked-by: Helge Deller <deller@gmx.de>

I even think the whole driver can go away...

Helge

PS: Maybe some really old 68000-based HP machines needed that, but
I don't know if any recent Linux kernel runs on those old boxes any
longer...


>> ---
>>   drivers/input/misc/hp_sdc_rtc.c | 342 -------------------------------=
-
>>   1 file changed, 342 deletions(-)
>>
>> diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sd=
c_rtc.c
>> index abca895a6156..199bc17ddb1d 100644
>> --- a/drivers/input/misc/hp_sdc_rtc.c
>> +++ b/drivers/input/misc/hp_sdc_rtc.c
>> @@ -53,28 +53,10 @@ MODULE_LICENSE("Dual BSD/GPL");
>>
>>   #define RTC_VERSION "1.10d"
>>
>> -static DEFINE_MUTEX(hp_sdc_rtc_mutex);
>>   static unsigned long epoch =3D 2000;
>>
>>   static struct semaphore i8042tregs;
>>
>> -static hp_sdc_irqhook hp_sdc_rtc_isr;
>> -
>> -static struct fasync_struct *hp_sdc_rtc_async_queue;
>> -
>> -static DECLARE_WAIT_QUEUE_HEAD(hp_sdc_rtc_wait);
>> -
>> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
>> -			       size_t count, loff_t *ppos);
>> -
>> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
>> -				      unsigned int cmd, unsigned long arg);
>> -
>> -static unsigned int hp_sdc_rtc_poll(struct file *file, poll_table *wai=
t);
>> -
>> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file);
>> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on);
>> -
>>   static void hp_sdc_rtc_isr (int irq, void *dev_id,
>>   			    uint8_t status, uint8_t data)
>>   {
>> @@ -283,151 +265,6 @@ static inline int hp_sdc_rtc_read_ct(struct times=
pec64 *res) {
>>   	return 0;
>>   }
>>
>> -
>> -#if 0 /* not used yet */
>> -/* Set the i8042 real-time clock */
>> -static int hp_sdc_rtc_set_rt (struct timeval *setto)
>> -{
>> -	uint32_t tenms;
>> -	unsigned int days;
>> -	hp_sdc_transaction t;
>> -	uint8_t tseq[11] =3D {
>> -		HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
>> -		HP_SDC_CMD_SET_RTMS, 3, 0, 0, 0,
>> -		HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
>> -		HP_SDC_CMD_SET_RTD, 2, 0, 0
>> -	};
>> -
>> -	t.endidx =3D 10;
>> -
>> -	if (0xffff < setto->tv_sec / 86400) return -1;
>> -	days =3D setto->tv_sec / 86400;
>> -	if (0xffff < setto->tv_usec / 1000000 / 86400) return -1;
>> -	days +=3D ((setto->tv_sec % 86400) + setto->tv_usec / 1000000) / 8640=
0;
>> -	if (days > 0xffff) return -1;
>> -
>> -	if (0xffffff < setto->tv_sec) return -1;
>> -	tenms  =3D setto->tv_sec * 100;
>> -	if (0xffffff < setto->tv_usec / 10000) return -1;
>> -	tenms +=3D setto->tv_usec / 10000;
>> -	if (tenms > 0xffffff) return -1;
>> -
>> -	tseq[3] =3D (uint8_t)(tenms & 0xff);
>> -	tseq[4] =3D (uint8_t)((tenms >> 8)  & 0xff);
>> -	tseq[5] =3D (uint8_t)((tenms >> 16) & 0xff);
>> -
>> -	tseq[9] =3D (uint8_t)(days & 0xff);
>> -	tseq[10] =3D (uint8_t)((days >> 8) & 0xff);
>> -
>> -	t.seq =3D	tseq;
>> -
>> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
>> -	return 0;
>> -}
>> -
>> -/* Set the i8042 fast handshake timer */
>> -static int hp_sdc_rtc_set_fhs (struct timeval *setto)
>> -{
>> -	uint32_t tenms;
>> -	hp_sdc_transaction t;
>> -	uint8_t tseq[5] =3D {
>> -		HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
>> -		HP_SDC_CMD_SET_FHS, 2, 0, 0
>> -	};
>> -
>> -	t.endidx =3D 4;
>> -
>> -	if (0xffff < setto->tv_sec) return -1;
>> -	tenms  =3D setto->tv_sec * 100;
>> -	if (0xffff < setto->tv_usec / 10000) return -1;
>> -	tenms +=3D setto->tv_usec / 10000;
>> -	if (tenms > 0xffff) return -1;
>> -
>> -	tseq[3] =3D (uint8_t)(tenms & 0xff);
>> -	tseq[4] =3D (uint8_t)((tenms >> 8)  & 0xff);
>> -
>> -	t.seq =3D	tseq;
>> -
>> -	if (hp_sdc_enqueue_transaction(&t)) return -1;
>> -	return 0;
>> -}
>> -
>> -
>> -/* Set the i8042 match timer (a.k.a. alarm) */
>> -#define hp_sdc_rtc_set_mt (setto) \
>> -	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_MT)
>> -
>> -/* Set the i8042 delay timer */
>> -#define hp_sdc_rtc_set_dt (setto) \
>> -	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_DT)
>> -
>> -/* Set the i8042 cycle timer (a.k.a. periodic) */
>> -#define hp_sdc_rtc_set_ct (setto) \
>> -	hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_CT)
>> -
>> -/* Set one of the i8042 3-byte wide timers */
>> -static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t s=
etcmd)
>> -{
>> -	uint32_t tenms;
>> -	hp_sdc_transaction t;
>> -	uint8_t tseq[6] =3D {
>> -		HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
>> -		0, 3, 0, 0, 0
>> -	};
>> -
>> -	t.endidx =3D 6;
>> -
>> -	if (0xffffff < setto->tv_sec) return -1;
>> -	tenms  =3D setto->tv_sec * 100;
>> -	if (0xffffff < setto->tv_usec / 10000) return -1;
>> -	tenms +=3D setto->tv_usec / 10000;
>> -	if (tenms > 0xffffff) return -1;
>> -
>> -	tseq[1] =3D setcmd;
>> -	tseq[3] =3D (uint8_t)(tenms & 0xff);
>> -	tseq[4] =3D (uint8_t)((tenms >> 8)  & 0xff);
>> -	tseq[5] =3D (uint8_t)((tenms >> 16)  & 0xff);
>> -
>> -	t.seq =3D			tseq;
>> -
>> -	if (hp_sdc_enqueue_transaction(&t)) {
>> -		return -1;
>> -	}
>> -	return 0;
>> -}
>> -#endif
>> -
>> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
>> -			       size_t count, loff_t *ppos) {
>> -	ssize_t retval;
>> -
>> -        if (count < sizeof(unsigned long))
>> -                return -EINVAL;
>> -
>> -	retval =3D put_user(68, (unsigned long __user *)buf);
>> -	return retval;
>> -}
>> -
>> -static __poll_t hp_sdc_rtc_poll(struct file *file, poll_table *wait)
>> -{
>> -        unsigned long l;
>> -
>> -	l =3D 0;
>> -        if (l !=3D 0)
>> -                return EPOLLIN | EPOLLRDNORM;
>> -        return 0;
>> -}
>> -
>> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file)
>> -{
>> -        return 0;
>> -}
>> -
>> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on)
>> -{
>> -        return fasync_helper (fd, filp, on, &hp_sdc_rtc_async_queue);
>> -}
>> -
>>   static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
>>   {
>>   #define YN(bit) ("no")
>> @@ -507,182 +344,6 @@ static int hp_sdc_rtc_proc_show(struct seq_file *=
m, void *v)
>>   #undef NY
>>   }
>>
>> -static int hp_sdc_rtc_ioctl(struct file *file,
>> -			    unsigned int cmd, unsigned long arg)
>> -{
>> -#if 1
>> -	return -EINVAL;
>> -#else
>> -
>> -        struct rtc_time wtime;
>> -	struct timeval ttime;
>> -	int use_wtime =3D 0;
>> -
>> -	/* This needs major work. */
>> -
>> -        switch (cmd) {
>> -
>> -        case RTC_AIE_OFF:       /* Mask alarm int. enab. bit    */
>> -        case RTC_AIE_ON:        /* Allow alarm interrupts.      */
>> -	case RTC_PIE_OFF:       /* Mask periodic int. enab. bit */
>> -        case RTC_PIE_ON:        /* Allow periodic ints          */
>> -        case RTC_UIE_ON:        /* Allow ints for RTC updates.  */
>> -        case RTC_UIE_OFF:       /* Allow ints for RTC updates.  */
>> -        {
>> -		/* We cannot mask individual user timers and we
>> -		   cannot tell them apart when they occur, so it
>> -		   would be disingenuous to succeed these IOCTLs */
>> -		return -EINVAL;
>> -        }
>> -        case RTC_ALM_READ:      /* Read the present alarm time */
>> -        {
>> -		if (hp_sdc_rtc_read_mt(&ttime)) return -EFAULT;
>> -		if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
>> -
>> -		wtime.tm_hour =3D ttime.tv_sec / 3600;  ttime.tv_sec %=3D 3600;
>> -		wtime.tm_min  =3D ttime.tv_sec / 60;    ttime.tv_sec %=3D 60;
>> -		wtime.tm_sec  =3D ttime.tv_sec;
>> -
>> -		break;
>> -        }
>> -        case RTC_IRQP_READ:     /* Read the periodic IRQ rate.  */
>> -        {
>> -                return put_user(hp_sdc_rtc_freq, (unsigned long *)arg)=
;
>> -        }
>> -        case RTC_IRQP_SET:      /* Set periodic IRQ rate.       */
>> -        {
>> -                /*
>> -                 * The max we can do is 100Hz.
>> -		 */
>> -
>> -                if ((arg < 1) || (arg > 100)) return -EINVAL;
>> -		ttime.tv_sec =3D 0;
>> -		ttime.tv_usec =3D 1000000 / arg;
>> -		if (hp_sdc_rtc_set_ct(&ttime)) return -EFAULT;
>> -		hp_sdc_rtc_freq =3D arg;
>> -                return 0;
>> -        }
>> -        case RTC_ALM_SET:       /* Store a time into the alarm */
>> -        {
>> -                /*
>> -                 * This expects a struct hp_sdc_rtc_time. Writing 0xff=
 means
>> -                 * "don't care" or "match all" for PC timers.  The HP =
SDC
>> -		 * does not support that perk, but it could be emulated fairly
>> -		 * easily.  Only the tm_hour, tm_min and tm_sec are used.
>> -		 * We could do it with 10ms accuracy with the HP SDC, if the
>> -		 * rtc interface left us a way to do that.
>> -                 */
>> -                struct hp_sdc_rtc_time alm_tm;
>> -
>> -                if (copy_from_user(&alm_tm, (struct hp_sdc_rtc_time*)a=
rg,
>> -                                   sizeof(struct hp_sdc_rtc_time)))
>> -                       return -EFAULT;
>> -
>> -                if (alm_tm.tm_hour > 23) return -EINVAL;
>> -		if (alm_tm.tm_min  > 59) return -EINVAL;
>> -		if (alm_tm.tm_sec  > 59) return -EINVAL;
>> -
>> -		ttime.sec =3D alm_tm.tm_hour * 3600 +
>> -		  alm_tm.tm_min * 60 + alm_tm.tm_sec;
>> -		ttime.usec =3D 0;
>> -		if (hp_sdc_rtc_set_mt(&ttime)) return -EFAULT;
>> -                return 0;
>> -        }
>> -        case RTC_RD_TIME:       /* Read the time/date from RTC  */
>> -        {
>> -		if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
>> -                break;
>> -        }
>> -        case RTC_SET_TIME:      /* Set the RTC */
>> -        {
>> -                struct rtc_time hp_sdc_rtc_tm;
>> -                unsigned char mon, day, hrs, min, sec, leap_yr;
>> -                unsigned int yrs;
>> -
>> -                if (!capable(CAP_SYS_TIME))
>> -                        return -EACCES;
>> -		if (copy_from_user(&hp_sdc_rtc_tm, (struct rtc_time *)arg,
>> -                                   sizeof(struct rtc_time)))
>> -                        return -EFAULT;
>> -
>> -                yrs =3D hp_sdc_rtc_tm.tm_year + 1900;
>> -                mon =3D hp_sdc_rtc_tm.tm_mon + 1;   /* tm_mon starts a=
t zero */
>> -                day =3D hp_sdc_rtc_tm.tm_mday;
>> -                hrs =3D hp_sdc_rtc_tm.tm_hour;
>> -                min =3D hp_sdc_rtc_tm.tm_min;
>> -                sec =3D hp_sdc_rtc_tm.tm_sec;
>> -
>> -                if (yrs < 1970)
>> -                        return -EINVAL;
>> -
>> -                leap_yr =3D ((!(yrs % 4) && (yrs % 100)) || !(yrs % 40=
0));
>> -
>> -                if ((mon > 12) || (day =3D=3D 0))
>> -                        return -EINVAL;
>> -                if (day > (days_in_mo[mon] + ((mon =3D=3D 2) && leap_y=
r)))
>> -                        return -EINVAL;
>> -		if ((hrs >=3D 24) || (min >=3D 60) || (sec >=3D 60))
>> -                        return -EINVAL;
>> -
>> -                if ((yrs -=3D eH) > 255)    /* They are unsigned */
>> -                        return -EINVAL;
>> -
>> -
>> -                return 0;
>> -        }
>> -        case RTC_EPOCH_READ:    /* Read the epoch.      */
>> -        {
>> -                return put_user (epoch, (unsigned long *)arg);
>> -        }
>> -        case RTC_EPOCH_SET:     /* Set the epoch.       */
>> -        {
>> -                /*
>> -                 * There were no RTC clocks before 1900.
>> -                 */
>> -                if (arg < 1900)
>> -		  return -EINVAL;
>> -		if (!capable(CAP_SYS_TIME))
>> -		  return -EACCES;
>> -
>> -                epoch =3D arg;
>> -                return 0;
>> -        }
>> -        default:
>> -                return -EINVAL;
>> -        }
>> -        return copy_to_user((void *)arg, &wtime, sizeof wtime) ? -EFAU=
LT : 0;
>> -#endif
>> -}
>> -
>> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
>> -				      unsigned int cmd, unsigned long arg)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&hp_sdc_rtc_mutex);
>> -	ret =3D hp_sdc_rtc_ioctl(file, cmd, arg);
>> -	mutex_unlock(&hp_sdc_rtc_mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -
>> -static const struct file_operations hp_sdc_rtc_fops =3D {
>> -        .owner =3D		THIS_MODULE,
>> -        .llseek =3D		no_llseek,
>> -        .read =3D			hp_sdc_rtc_read,
>> -        .poll =3D			hp_sdc_rtc_poll,
>> -        .unlocked_ioctl =3D	hp_sdc_rtc_unlocked_ioctl,
>> -        .open =3D			hp_sdc_rtc_open,
>> -        .fasync =3D		hp_sdc_rtc_fasync,
>> -};
>> -
>> -static struct miscdevice hp_sdc_rtc_dev =3D {
>> -        .minor =3D	RTC_MINOR,
>> -        .name =3D		"rtc_HIL",
>> -        .fops =3D		&hp_sdc_rtc_fops
>> -};
>> -
>>   static int __init hp_sdc_rtc_init(void)
>>   {
>>   	int ret;
>> @@ -696,8 +357,6 @@ static int __init hp_sdc_rtc_init(void)
>>
>>   	if ((ret =3D hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
>>   		return ret;
>> -	if (misc_register(&hp_sdc_rtc_dev) !=3D 0)
>> -		printk(KERN_INFO "Could not register misc. dev for i8042 rtc\n");
>>
>>           proc_create_single("driver/rtc", 0, NULL, hp_sdc_rtc_proc_sho=
w);
>>
>> @@ -710,7 +369,6 @@ static int __init hp_sdc_rtc_init(void)
>>   static void __exit hp_sdc_rtc_exit(void)
>>   {
>>   	remove_proc_entry ("driver/rtc", NULL);
>> -        misc_deregister(&hp_sdc_rtc_dev);
>>   	hp_sdc_release_timer_irq(hp_sdc_rtc_isr);
>>           printk(KERN_INFO "HP i8042 SDC + MSM-58321 RTC support unload=
ed\n");
>>   }
>> --
>> 2.20.0
>>
>

